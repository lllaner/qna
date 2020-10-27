require 'rails_helper'

feature 'User can sign out', %q{
  In order to complete session
  As an authenticated user
  I'd like to be able to sign out
} do
  given(:user) { create(:user) }

  background do
    sign_in(user)
  end

  scenario 'Authenticated user tries to sign out' do
    click_on 'Log out'

    expect(page).to have_content 'Signed out successfully.'
  end
end
