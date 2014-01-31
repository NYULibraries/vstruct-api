require 'spec_helper'

describe "vstructs/edit" do
  before(:each) do
    @vstruct = assign(:vstruct, stub_model(Vstruct,
      :label => "MyString",
      :streaming_fname => "MyString",
      :digitization_notes => "MyText",
      :status => "MyString"
    ))
  end

  it "renders the edit vstruct form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", vstruct_path(@vstruct), "post" do
      assert_select "input#vstruct_label[name=?]", "vstruct[label]"
      assert_select "input#vstruct_streaming_fname[name=?]", "vstruct[streaming_fname]"
      assert_select "textarea#vstruct_digitization_notes[name=?]", "vstruct[digitization_notes]"
      assert_select "input#vstruct_status[name=?]", "vstruct[status]"
    end
  end
end
