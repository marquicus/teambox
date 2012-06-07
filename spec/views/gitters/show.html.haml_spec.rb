require 'spec_helper'

describe "gitters/show.html.haml" do
  before(:each) do
    @gitter = assign(:gitter, stub_model(Gitter))
  end

  it "renders attributes in <p>" do
    render
  end
end
