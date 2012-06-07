require 'spec_helper'

describe "git_repositories/index.html.haml" do
  before(:each) do
    assign(:git_repositories, [
      stub_model(GitRepository),
      stub_model(GitRepository)
    ])
  end

  it "renders a list of git_repositories" do
    render
  end
end
