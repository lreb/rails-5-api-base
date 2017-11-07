require 'rails_helper'

RSpec.describe "SystemCollections", type: :request do
  describe "GET /system_collections" do
    it "works! (now write some real specs)" do
      get system_collections_path
      expect(response).to have_http_status(200)
    end
  end
end
