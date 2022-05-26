require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  let(:test_user) { create :user }
  before { sign_in test_user }

  describe 'GET /index' do
    before(:each) do
      get categories_url
    end

    it 'renders a successful response' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      expect(response.body).to include('Categories')
    end
  end

  describe 'GET /new' do
    before(:each) do
      get new_category_url
    end

    it 'renders a successful response' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      expect(response.body).to include('New Category')
    end
  end
end
