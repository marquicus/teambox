require 'spec_helper'

describe "mvc_demos/index.html.haml" do
  before(:each) do
    assign(:mvc_demos, [
      stub_model(MvcDemo),
      stub_model(MvcDemo)
    ])
  end

  it "renders a list of mvc_demos" do
    render
  end
end
