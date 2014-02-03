require 'spec_helper'

describe "vclips/edit" do
  before(:each) do
    @vclip = assign(:vclip, stub_model(Vclip,
      :vstruct_id => "",
      :label => "MyString",
      :type => "",
      :clip_order => 1,
      :lock_version => 1
    ))
  end

  it "renders the edit vclip form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", vclip_path(@vclip), "post" do
      assert_select "input#vclip_vstruct_id[name=?]", "vclip[vstruct_id]"
      assert_select "input#vclip_label[name=?]", "vclip[label]"
      assert_select "input#vclip_type[name=?]", "vclip[type]"
      assert_select "input#vclip_clip_order[name=?]", "vclip[clip_order]"
      assert_select "input#vclip_lock_version[name=?]", "vclip[lock_version]"
    end
  end
end
