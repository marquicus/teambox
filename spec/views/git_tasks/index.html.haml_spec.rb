require 'spec_helper'

describe "git_tasks/index.html.haml" do
  before(:each) do
    assign(:git_tasks, [
      stub_model(GitTask),
      stub_model(GitTask)
    ])
  end

  it "renders a list of git_tasks" do
    render
  end
end
