require "spec_helper"

describe VclipsController do
  describe "routing" do

    it "routes to #index" do
      get("/vclips").should route_to("vclips#index")
    end

    it "routes to #new" do
      get("/vclips/new").should route_to("vclips#new")
    end

    it "routes to #show" do
      get("/vclips/1").should route_to("vclips#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vclips/1/edit").should route_to("vclips#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vclips").should route_to("vclips#create")
    end

    it "routes to #update" do
      put("/vclips/1").should route_to("vclips#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vclips/1").should route_to("vclips#destroy", :id => "1")
    end

  end
end
