require 'spec_helper'

describe Api::V0::VclipsController do

  let(:valid_attributes) { { "vstruct_id" => "10f92205-25a8-4590-94a9-6ccfa0590545",
      "clip_type" => 'clip_type', "time_in" => 'time_in', "time_out" => 'time_out',
      "label" => 'label',  "clip_order" => 0} }

  let(:changed_attributes) { { "vstruct_id" => "11192205-25a8-4590-94a9-6ccfa0590545",
      "clip_type" => 'hohoho', "time_in" => 'hehehe', "time_out" => 'hahaha',
      "label" => 'not-label',  "clip_order" => 1} }

  let(:valid_session) { {} }


  def create_vstruct
    Vstruct.create!({id: "10f92205-25a8-4590-94a9-6ccfa0590545"})
  end
  def merge_params(h)
    {format: :json}.merge(h)
  end

  describe "GET index" do
    it "assigns all vclips as @vclips" do
      create_vstruct
      vclip = Vclip.create! valid_attributes
      get :index, merge_params({vstruct_id: '10f92205-25a8-4590-94a9-6ccfa0590545'}), valid_session
      assigns(:vclips).should eq([vclip])
    end
  end

  describe "GET show" do
    it "assigns the requested vclip as @vclip" do
      vclip = Vclip.create! valid_attributes
      get :show, merge_params({:id => vclip.to_param}), valid_session
      assigns(:vclip).should eq(vclip)
    end
  end

  describe "POST create" do
    before(:each) { create_vstruct }
    describe "with valid params" do
      it "creates a new Vclip" do
        expect {
          post :create, merge_params({vstruct_id: '10f92205-25a8-4590-94a9-6ccfa0590545', :vclip => valid_attributes}), valid_session
        }.to change(Vclip, :count).by(1)
      end

      it "assigns a newly created vclip as @vclip" do
        post :create, merge_params({vstruct_id: '10f92205-25a8-4590-94a9-6ccfa0590545', :vclip => valid_attributes}), valid_session
        assigns(:vclip).should be_a(Vclip)
        assigns(:vclip).should be_persisted
      end
    end

    describe "with invalid params" do
      it "does not create a new Vclip" do
        expect {
          post :create, merge_params({vstruct_id: '10f92205-25a8-4590-94a9-6ccfa0590545', :vclip => { id: "boo" }}), valid_session
        }.to change(Vclip, :count).by(0)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested vclip" do
        vclip = Vclip.create! valid_attributes
        Vclip.any_instance.should_receive(:update).with({ "vstruct_id" => "" })
        put :update, merge_params({:id => vclip.to_param, :vclip => { "vstruct_id" => "" }}), valid_session
      end

      it "assigns the requested vclip as @vclip" do
        vclip = Vclip.create! valid_attributes
        put :update, merge_params({:id => vclip.to_param, :vclip => valid_attributes}), valid_session
        assigns(:vclip).should eq(vclip)
      end

      it "modified the whitelisted attributes" do
        vclip = Vclip.create! valid_attributes
        put :update, merge_params({:id => vclip.to_param, :vclip => changed_attributes}), valid_session
        assigns(:vclip).vstruct_id.should eq(changed_attributes["vstruct_id"])
        assigns(:vclip).time_in.should    eq(changed_attributes["time_in"])
        assigns(:vclip).time_out.should   eq(changed_attributes["time_out"])
        assigns(:vclip).label.should      eq(changed_attributes["label"])
        assigns(:vclip).clip_type.should  eq(changed_attributes["clip_type"])
        assigns(:vclip).clip_order.should eq(changed_attributes["clip_order"])
      end
    end

    describe "with invalid params" do
      it "assigns the vclip as @vclip" do
        vclip = Vclip.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Vclip.any_instance.stub(:save).and_return(false)
        put :update, merge_params({:id => vclip.to_param, :vclip => { "vstruct_id" => "invalid value" }}), valid_session
        assigns(:vclip).should eq(vclip)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested vclip" do
      vclip = Vclip.create! valid_attributes
      expect {
        delete :destroy, merge_params({:id => vclip.to_param}), valid_session
      }.to change(Vclip, :count).by(-1)
    end
  end

end
