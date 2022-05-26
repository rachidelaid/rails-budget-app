require 'rails_helper'

RSpec.describe 'Categories index', type: :system do
  let(:test_user) { create :user }

  before do
    driven_by(:rack_test)
    sign_in test_user

    visit categories_path
  end

  it 'title should be Categories' do
    expect(page).to have_content('Categories')
  end

  it 'should show the New Category button' do
    expect(page).to have_content('New Category')
  end

  it 'Should lead to the new category page' do
    click_link('New Category')
    expect(current_path).to eql(new_category_path)
  end
end
