require 'spec_helper'

describe "mvc_demos/edit.html.haml" do
  before(:each) do
    @mvc_demo = assign(:mvc_demo, stub_model(MvcDemo))
  end

  it "renders the edit mvc_demo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => mvc_demo_path(@mvc_demo), :method => "post" do
    end
  end
end
