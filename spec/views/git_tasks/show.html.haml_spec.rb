require 'spec_helper'

describe "git_tasks/show.html.haml" do
  before(:each) do
    @git_task = assign(:git_task, stub_model(GitTask))
  end

  it "renders attributes in <p>" do
    render
  end
end
