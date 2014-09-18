require 'rails_helper'

RSpec.describe "Monuments", :type => :request do
  describe "GET /monuments" do
    it "works! (now write some real specs)" do
      get monuments_path
      expect(response).to have_http_status(200)
    end
  end
end
