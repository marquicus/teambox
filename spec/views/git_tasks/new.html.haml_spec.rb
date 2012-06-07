require 'spec_helper'

describe "git_tasks/new.html.haml" do
  before(:each) do
    assign(:git_task, stub_model(GitTask).as_new_record)
  end

  it "renders new git_task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => git_tasks_path, :method => "post" do
    end
  end
end
