require 'spec_helper'

describe "vstructs/show" do
  before(:each) do
    @vstruct = assign(:vstruct, stub_model(Vstruct,
      :label => "Label",
      :streaming_fname => "Streaming Fname",
      :digitization_notes => "MyText",
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Label/)
    rendered.should match(/Streaming Fname/)
    rendered.should match(/MyText/)
    rendered.should match(/Status/)
  end
end
