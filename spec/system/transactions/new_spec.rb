require 'rails_helper'

RSpec.describe 'Transactions new', type: :system do
  let(:test_user) { create :user }

  before do
    driven_by(:rack_test)
    sign_in test_user

    @category = Category.create(name: "apple", logo: "apple.png", user_id: test_user.id)

    visit new_category_transaction_path(@category.id)
  end

  it 'title should be New Transaction' do
    expect(page).to have_content('New Transaction')
  end

  it 'should show the name input' do
    expect(page).to have_css('#transaction_name')
  end

  it 'should show the logo input' do
    expect(page).to have_css('#transaction_amount')
  end
end
