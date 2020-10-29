require 'rails_helper'

feature 'User can delete an answer', %q{
  In order to hide an answer
  As an author
  I'd like be able to delete an answer of a question
} do
  given(:users) { create_list(:user, 2) }
  given(:question) { create(:question, user_id: users.first.id) }
  given!(:answer) { create(:answer, question: question, user_id: users.first.id) }

  describe 'Authenicated' do
    scenario 'authror try to delete a answer' do
      sign_in(users.first)
      visit question_path(question)
      click_on 'Delete answer'
      expect(page).to have_content 'The answer was successfully deleted.'
    end

    scenario "user can't see a delete button" do
      sign_in(users.last)
      visit question_path(question)

    end
  end

  describe 'Unauthenticated' do
    scenario "can't see delete button" do
      visit question_path(question)
      expect(page).to_not have_content 'Delete answer'
    end
  end
end
