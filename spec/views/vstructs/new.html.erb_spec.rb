require 'spec_helper'

describe "vstructs/new" do
  before(:each) do
    assign(:vstruct, stub_model(Vstruct,
      :label => "MyString",
      :streaming_fname => "MyString",
      :digitization_notes => "MyText",
      :status => "MyString"
    ).as_new_record)
  end

  it "renders new vstruct form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", vstructs_path, "post" do
      assert_select "input#vstruct_label[name=?]", "vstruct[label]"
      assert_select "input#vstruct_streaming_fname[name=?]", "vstruct[streaming_fname]"
      assert_select "textarea#vstruct_digitization_notes[name=?]", "vstruct[digitization_notes]"
      assert_select "input#vstruct_status[name=?]", "vstruct[status]"
    end
  end
end
