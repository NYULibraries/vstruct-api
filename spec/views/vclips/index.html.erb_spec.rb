require 'spec_helper'

describe "vclips/index" do
  before(:each) do
    assign(:vclips, [
      stub_model(Vclip,
        :vstruct_id => "803a63d3-d857-4bbc-87b4-c5ec1de0bdac",
        :label => "Label",
        :type => "Type",
        :clip_order => 1,
        :lock_version => 2
      ),
      stub_model(Vclip,
        :vstruct_id => "56c5d0fd-734f-4d29-96d0-cce2d6fa21fe",
        :label => "Label",
        :type => "Type",
        :clip_order => 2,
        :lock_version => 3
      )
    ])
  end

  it "renders a list of vclips" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "803a63d3-d857-4bbc-87b4-c5ec1de0bdac".to_s, :count => 1
    assert_select "tr>td", :text => "56c5d0fd-734f-4d29-96d0-cce2d6fa21fe".to_s, :count => 1
    assert_select "tr>td", :text => "Label".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 1
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 1
  end
end
