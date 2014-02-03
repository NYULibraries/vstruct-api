require 'spec_helper'

describe "vclips/show" do
  before(:each) do
    @vclip = assign(:vclip, stub_model(Vclip,
      :vstruct_id => "",
      :label => "Label",
      :type => "Type",
      :clip_order => 1,
      :lock_version => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Label/)
    rendered.should match(/Type/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
