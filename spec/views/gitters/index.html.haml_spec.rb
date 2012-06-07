require 'spec_helper'

describe "gitters/index.html.haml" do
  before(:each) do
    assign(:gitters, [
      stub_model(Gitter),
      stub_model(Gitter)
    ])
  end

  it "renders a list of gitters" do
    render
  end
end
