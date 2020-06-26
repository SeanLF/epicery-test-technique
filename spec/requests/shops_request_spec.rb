# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Shops', type: :request do
  let(:shop) { Shop.find_or_create_by(name: 'Shop A', slug: 'shop-a', available_on: Date.today) }

  describe 'GET /shops' do
    it 'returns http success' do
      get '/shops'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /shops/:slug' do
    it 'returns http success' do
      get "/shops/#{shop.slug}"
      expect(response).to have_http_status(:success)
    end

    it 'fails http success' do
      get '/shops/missing-slug'
      expect(response).to have_http_status(:missing)
    end
  end
end
