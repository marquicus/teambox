require 'spec_helper'

describe "git_commits/edit.html.haml" do
  before(:each) do
    @git_commit = assign(:git_commit, stub_model(GitCommit))
  end

  it "renders the edit git_commit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => git_commit_path(@git_commit), :method => "post" do
    end
  end
end
