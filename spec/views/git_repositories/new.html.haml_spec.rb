require 'spec_helper'

describe "git_repositories/new.html.haml" do
  before(:each) do
    assign(:git_repository, stub_model(GitRepository).as_new_record)
  end

  it "renders new git_repository form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => git_repositories_path, :method => "post" do
    end
  end
end
