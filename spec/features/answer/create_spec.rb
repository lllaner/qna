require 'rails_helper'

feature 'User can add an answer to a question', %q{
  In order to help with a question
  As an authenticated user
  I'd like be able to answer on a question
} do
  given(:question) { create(:question) }

  describe 'Authenticated user' do
    given(:user) { create(:user) }

    background do
      sign_in(user)

      visit question_path(question)
    end

    scenario 'add answer' do
      fill_in 'Body', with: 'Answer body text'
      click_on 'Add answer'
      expect(page).to have_content 'The Answer was successfully created'
      expect(page).to have_content 'Answer body text'
    end

    scenario 'add invalid answer' do
      click_on 'Add answer'
      expect(page).to have_content "Body can't be blank"
    end
  end

  scenario 'Unauthenticated user add answer' do
    visit question_path(question)
    click_on 'Add answer'
    expect(page).to have_content "You need to sign in or sign up before continuing."
  end
end
