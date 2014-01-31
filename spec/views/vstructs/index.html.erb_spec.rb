require 'spec_helper'

describe "vstructs/index" do
  before(:each) do
    assign(:vstructs, [
      stub_model(Vstruct,
        :label => "Label",
        :streaming_fname => "Streaming Fname",
        :digitization_notes => "MyText",
        :status => "Status"
      ),
      stub_model(Vstruct,
        :label => "Label",
        :streaming_fname => "Streaming Fname",
        :digitization_notes => "MyText",
        :status => "Status"
      )
    ])
  end

  it "renders a list of vstructs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Label".to_s, :count => 2
    assert_select "tr>td", :text => "Streaming Fname".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
