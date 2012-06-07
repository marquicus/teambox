require 'spec_helper'

describe "gitters/edit.html.haml" do
  before(:each) do
    @gitter = assign(:gitter, stub_model(Gitter))
  end

  it "renders the edit gitter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => gitter_path(@gitter), :method => "post" do
    end
  end
end
