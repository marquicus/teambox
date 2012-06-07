require 'spec_helper'

describe "git_repositories/show.html.haml" do
  before(:each) do
    @git_repository = assign(:git_repository, stub_model(GitRepository))
  end

  it "renders attributes in <p>" do
    render
  end
end
