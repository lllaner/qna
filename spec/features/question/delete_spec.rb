require 'rails_helper'

feature 'User can delete question', %q{
  In order to hide a question
  As an authenticated user
  I'd like to be able to delete a question
} do
  given(:users) { create_list(:user, 2) }
  given(:question) { create(:question, user_id: users.first.id) }

  describe 'Authenticated' do
    scenario 'Author try to delete a question' do
      sign_in(users.first)
      visit question_path(question)
      click_on 'Delete question'
      expect(page).to have_content 'The question was successfully deleted.'
    end

    scenario "User can't see delete question button" do
      sign_in(users.second)
      visit question_path(question)
      expect(page).to_not have_content "Delete question"
    end
  end

  describe 'Unauthenticated' do
    scenario "User can't see delete question button" do
      visit question_path(question)
      expect(page).to_not have_content "Delete question"
    end
  end
end
