require 'rails_helper'

RSpec.describe 'Splash index', type: :system do
  before do
    driven_by(:rack_test)

    visit root_path
  end

  it 'title should be Budget APP' do
    expect(page).to have_content('Budget APP')
  end

  it 'should show the log in link' do
    expect(page).to have_content('Log in')
  end

  it 'should show the sign up link' do
    expect(page).to have_content('Sign up')
  end
end
