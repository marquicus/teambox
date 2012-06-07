require 'spec_helper'

describe "MvcDemos" do
  describe "GET /mvc_demos" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get mvc_demos_path
      response.status.should be(200)
    end
  end
end
