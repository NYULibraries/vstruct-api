require "spec_helper"

describe VstructsController do
  describe "routing" do

    it "routes to #index" do
      get("/vstructs").should route_to("vstructs#index")
    end

    it "routes to #new" do
      get("/vstructs/new").should route_to("vstructs#new")
    end

    it "routes to #show" do
      get("/vstructs/1").should route_to("vstructs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vstructs/1/edit").should route_to("vstructs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vstructs").should route_to("vstructs#create")
    end

    it "routes to #update" do
      put("/vstructs/1").should route_to("vstructs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vstructs/1").should route_to("vstructs#destroy", :id => "1")
    end

  end
end
