require 'rails_helper'

feature 'User can see a question and answers', %q{
  In order to get answers on a question
  As an any user
  I'd like to be able to see question and answers
} do
  given(:question) { create(:question) }
  given(:answers) { create_list(:answer, 3, question: question) }

  scenario 'Any user visit to questions' do
    visit question_path(question)

    expect(page).to have_content question.title
    expect(page).to have_content question.body
    expect(page).to have_content answers.first.body
  end
end
