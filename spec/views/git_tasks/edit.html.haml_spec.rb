require 'spec_helper'

describe "git_tasks/edit.html.haml" do
  before(:each) do
    @git_task = assign(:git_task, stub_model(GitTask))
  end

  it "renders the edit git_task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => git_task_path(@git_task), :method => "post" do
    end
  end
end
