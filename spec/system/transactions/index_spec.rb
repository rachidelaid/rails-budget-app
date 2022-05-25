require 'rails_helper'

RSpec.describe 'Transactions index', type: :system do
  let(:test_user) { create :user }

  before do
    driven_by(:rack_test)
    sign_in test_user

    @category = Category.create(name: "apple", logo: "apple.png", user_id: test_user.id)

    visit category_transactions_path(@category.id)
  end

  it 'title should be Transactions' do
    expect(page).to have_content('Transactions')
  end

  it 'should show the Total' do
    expect(page).to have_content('Total:')
  end

  it 'Should lead to the New Transaction page' do
    click_link('New Transaction')
    expect(current_path).to eql(new_category_transaction_path(@category.id))
  end
end
