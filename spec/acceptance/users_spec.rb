require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource "Users" do
  let!(:user) { User.create(email: "test@gmail.com",  password: 'test@123') }

  before do
    header 'Accept', 'application/vnd.boilerplate-rails.com; version=1'
    header 'Content-Type', 'application/json'
    header 'X-Api-Key', ApiKeyHandler.encoded_api_key(user.id)
  end

  get "/users" do
    example "Listing users" do
      do_request

      expect(status).to eq 200
    end
  end
end
