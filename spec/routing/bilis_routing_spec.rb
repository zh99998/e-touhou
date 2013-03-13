require "spec_helper"

describe BilisController do
  describe "routing" do

    it "routes to #index" do
      get("/bilis").should route_to("bilis#index")
    end

    it "routes to #new" do
      get("/bilis/new").should route_to("bilis#new")
    end

    it "routes to #show" do
      get("/bilis/1").should route_to("bilis#show", :id => "1")
    end

    it "routes to #edit" do
      get("/bilis/1/edit").should route_to("bilis#edit", :id => "1")
    end

    it "routes to #create" do
      post("/bilis").should route_to("bilis#create")
    end

    it "routes to #update" do
      put("/bilis/1").should route_to("bilis#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/bilis/1").should route_to("bilis#destroy", :id => "1")
    end

  end
end
