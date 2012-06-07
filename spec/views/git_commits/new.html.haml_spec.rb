require 'spec_helper'

describe "git_commits/new.html.haml" do
  before(:each) do
    assign(:git_commit, stub_model(GitCommit).as_new_record)
  end

  it "renders new git_commit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => git_commits_path, :method => "post" do
    end
  end
end
