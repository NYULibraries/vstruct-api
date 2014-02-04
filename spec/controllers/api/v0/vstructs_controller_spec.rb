require 'spec_helper'

describe Api::V0::VstructsController do

  let(:valid_attributes) { { "label" => "MyString" } }

  let(:valid_session) { {} }

  def merge_params(h)
    {format: :json}.merge(h)
  end

  describe "GET index" do
    it "assigns all vstructs as @vstructs" do
      vstruct = Vstruct.create! valid_attributes
      get :index, merge_params({}), valid_session
      assigns(:vstructs).should eq([vstruct])
    end
  end

  describe "GET show" do
    it "assigns the requested vstruct as @vstruct" do
      vstruct = Vstruct.create! valid_attributes
      get :show, merge_params({:id => vstruct.to_param}), valid_session
      assigns(:vstruct).should eq(vstruct)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Vstruct" do
        expect {
          post :create, merge_params({:vstruct => valid_attributes}), valid_session
        }.to change(Vstruct, :count).by(1)
      end

      it "assigns a newly created vstruct as @vstruct" do
        post :create, merge_params({:vstruct => valid_attributes}), valid_session
        assigns(:vstruct).should be_a(Vstruct)
        assigns(:vstruct).should be_persisted
      end
    end

    describe "with invalid params" do
      it "does not create a new Vstruct" do
        expect {
          Vstruct.any_instance.stub(:save).and_return(false)
          post :create, merge_params({:vstruct => { id: 'boo' }}), valid_session
        }.to change(Vstruct, :count).by(0)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested vstruct" do
        vstruct = Vstruct.create! valid_attributes
        Vstruct.any_instance.should_receive(:update).with({ "label" => "MyString" })
        put :update, merge_params({:id => vstruct.to_param, :vstruct => { "label" => "MyString" }}), valid_session
      end

      it "assigns the requested vstruct as @vstruct" do
        vstruct = Vstruct.create! valid_attributes
        put :update, merge_params({:id => vstruct.to_param, :vstruct => valid_attributes}), valid_session
        assigns(:vstruct).should eq(vstruct)
      end
    end

    # TODO: change when model validations are in place
    describe "with invalid params" do
      it "assigns the vstruct as @vstruct" do
        vstruct = Vstruct.create! valid_attributes
        Vstruct.any_instance.stub(:save).and_return(false)
        put :update, merge_params({:id => vstruct.to_param, :vstruct => { "label" => "invalid value" }}), valid_session
        assigns(:vstruct).should eq(vstruct)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested vstruct" do
      vstruct = Vstruct.create! valid_attributes
      expect {
        delete :destroy, merge_params({:id => vstruct.to_param}), valid_session
      }.to change(Vstruct, :count).by(-1)
    end
  end

end
