require 'spec_helper'

describe "git_repositories/edit.html.haml" do
  before(:each) do
    @git_repository = assign(:git_repository, stub_model(GitRepository))
  end

  it "renders the edit git_repository form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => git_repository_path(@git_repository), :method => "post" do
    end
  end
end
