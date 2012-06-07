require 'spec_helper'

describe "git_commits/show.html.haml" do
  before(:each) do
    @git_commit = assign(:git_commit, stub_model(GitCommit))
  end

  it "renders attributes in <p>" do
    render
  end
end
