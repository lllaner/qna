require 'rails_helper'

feature 'User can see list of questions', %q{
  In order to get interested question
  As an any user
  I'd like to be able to see questions
} do
  given!(:questions) { create_list(:question, 3) }

  scenario 'Any user visit to questions' do
    visit questions_path

    expect(page).to have_content 'MyString'
  end
end
