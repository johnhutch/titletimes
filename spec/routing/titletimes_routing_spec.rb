require "spec_helper"

describe TitletimesController do
  describe "routing" do

    it "routes to #index" do
      get("/titletimes").should route_to("titletimes#index")
    end

    it "routes to #new" do
      get("/titletimes/new").should route_to("titletimes#new")
    end

    it "routes to #show" do
      get("/titletimes/1").should route_to("titletimes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/titletimes/1/edit").should route_to("titletimes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/titletimes").should route_to("titletimes#create")
    end

    it "routes to #update" do
      put("/titletimes/1").should route_to("titletimes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/titletimes/1").should route_to("titletimes#destroy", :id => "1")
    end

  end
end
