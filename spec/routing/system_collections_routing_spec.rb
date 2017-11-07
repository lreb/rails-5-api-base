require "rails_helper"

RSpec.describe SystemCollectionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/system_collections").to route_to("system_collections#index")
    end


    it "routes to #show" do
      expect(:get => "/system_collections/1").to route_to("system_collections#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/system_collections").to route_to("system_collections#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/system_collections/1").to route_to("system_collections#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/system_collections/1").to route_to("system_collections#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/system_collections/1").to route_to("system_collections#destroy", :id => "1")
    end

  end
end
