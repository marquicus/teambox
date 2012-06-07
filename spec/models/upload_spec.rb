# == Schema Information
#
# Table name: uploads
#
#  id                 :integer(4)      not null, primary key
#  user_id            :integer(4)
#  project_id         :integer(4)
#  comment_id         :integer(4)
#  page_id            :integer(4)
#  description        :text
#  asset_file_name    :string(255)
#  asset_content_type :string(255)
#  asset_file_size    :integer(4)
#  created_at         :datetime
#  updated_at         :datetime
#  deleted            :boolean(1)      default(FALSE), not null
#  is_private         :boolean(1)      default(FALSE), not null
#  parent_folder_id   :integer(4)
#  token              :string(16)
#
# Indexes
#
#  index_uploads_on_comment_id                             (comment_id)
#  index_uploads_on_deleted                                (deleted)
#  index_uploads_on_is_private                             (is_private)
#  index_uploads_on_page_id_and_asset_file_name            (page_id,asset_file_name)
#  index_uploads_on_project_id_and_deleted_and_updated_at  (project_id,deleted,updated_at)
#  index_uploads_on_token                                  (token)
#

require 'spec_helper'

describe Upload do
  before do
    @upload = Factory(:upload)
  end

  describe 'validations' do
    it { should belong_to(:user) }
    it { should belong_to(:project) }    
    it { should validate_presence_of(:asset_file_name) }
    
    it 'should validate format of asset filename' do
      {
        true => ["name", "name.png", "%&(){}.png"],
        false => ["na/me", "name/"],
      }.each do |is_valid, file_names|
        file_names.each do |file_name|
          @upload.asset_file_name = file_name
          @upload.valid?.should == is_valid
          @upload.errors.keys.include?(:asset_file_name).should == !is_valid
        end
      end 
    end
  end
  
  describe '#rename_asset' do
    it 'should fail when original names are not found' do
      @upload.asset.should_receive(:exists?).with(:original).and_return(false)
      @upload.asset.should_receive(:exists?).with(:thumb).and_return(false)
      @upload.asset.should_receive(:exists?).with(:small).and_return(false)
      @upload.rename_asset("new_pic.png").should be_false
      @upload.errors[:base].first.should match(/no files found/)
    end     

    it 'should fail when file name does not validate' do
      @upload.asset.stub!(:exists?).and_return(true)
      @upload.rename_asset("").should be_false
      @upload.errors[:asset_file_name].should_not be_empty
    end
    
    it 'should fail on expected exceptions and set base errors' do
      [Errno::ENOENT, AWS::S3::InvalidBucketName].each do |exception|
        @upload.should_receive(:asset).and_raise(exception.new("my error"))
        @upload.rename_asset("new_pic.png").should be_false
        @upload.errors[:base].first.should match(/my error/)
       end
    end
    
    describe 'with local asset storage' do
      before do 
        @upload.asset.stub!(:exists?).and_return(true) 
        Teambox.config.amazon_s3 = false
      end
      
      it 'should rename the local file' do
        basepath = File.dirname(File.dirname(@upload.asset.path))
        FileUtils.should_receive(:mv).with(
          File.join(basepath, "original/pic.png"), 
          File.join(basepath, "original/new_pic.png"))
        FileUtils.should_receive(:mv).with(
          File.join(basepath, "thumb/pic.png"), 
          File.join(basepath, "thumb/new_pic.png"))
        FileUtils.should_receive(:mv).with(
          File.join(basepath, "small/pic.png"),
          File.join(basepath, "small/new_pic.png"))
        @upload.rename_asset("new_pic.png").should be_true
        @upload.reload.asset_file_name.should == "new_pic.png"
      end
    end

    describe 'with S3 asset storage' do
      before do 
        Teambox.config.amazon_s3 = true
        @upload.asset.stub!(:exists?).and_return(true) 
        @upload.asset.stub!(:bucket_name).and_return("teambox")
      end
     
      it 'should rename the local file' do
        basepath = File.dirname(File.dirname(@upload.asset.path))
        AWS::S3::S3Object.should_receive(:rename).with(
          File.join(basepath, "original/pic.png"),
          File.join(basepath, "original/new_pic.png"), "teambox")
        AWS::S3::S3Object.should_receive(:rename).with(
          File.join(basepath, "thumb/pic.png"),
          File.join(basepath, "thumb/new_pic.png"), "teambox")
        AWS::S3::S3Object.should_receive(:rename).with(
          File.join(basepath, "small/pic.png"),
          File.join(basepath, "small/new_pic.png"), "teambox")
        @upload.rename_asset("new_pic.png").should be_true
        @upload.reload.asset_file_name.should == "new_pic.png"
      end
    end
  end
end
