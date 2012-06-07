require 'spec_helper'

describe "mvc_demos/show.html.haml" do
  before(:each) do
    @mvc_demo = assign(:mvc_demo, stub_model(MvcDemo))
  end

  it "renders attributes in <p>" do
    render
  end
end
