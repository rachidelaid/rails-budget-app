require 'rails_helper'

RSpec.describe 'Transactions', type: :request do
  let(:test_user) { create :user }
  before { 
    sign_in test_user
    @category = Category.create(name: "apple",  logo: "apple.png", user_id: test_user.id)
  }

  describe 'GET /index' do
    before(:each) do
      get category_transactions_url(@category.id)
    end

    it 'renders a successful response' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      expect(response.body).to include('Transactions')
    end
  end

  describe 'GET /new' do
    before(:each) do
      get new_category_transaction_url(@category.id)
    end

    it 'renders a successful response' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      expect(response.body).to include('New Transaction')
    end
  end
end
