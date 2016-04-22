require 'rails_helper'

RSpec.describe "Acceptors", type: :request do
  describe "GET /acceptors" do
    it "works! (now write some real specs)" do
      get acceptors_path
      expect(response).to have_http_status(200)
    end
  end
end
