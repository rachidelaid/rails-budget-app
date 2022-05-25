require 'rails_helper'

RSpec.describe 'Categories new', type: :system do
  let(:test_user) { create :user }

  before do
    driven_by(:rack_test)
    sign_in test_user

    visit new_category_path
  end

  it 'title should be New Category' do
    expect(page).to have_content('New Category')
  end

  it 'should show the name input' do
    expect(page).to have_css('#category_name')
  end

  it 'should show the logo input' do
    expect(page).to have_css('#category_logo')
  end
end
