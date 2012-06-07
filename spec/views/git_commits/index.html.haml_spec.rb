require 'spec_helper'

describe "git_commits/index.html.haml" do
  before(:each) do
    assign(:git_commits, [
      stub_model(GitCommit),
      stub_model(GitCommit)
    ])
  end

  it "renders a list of git_commits" do
    render
  end
end
