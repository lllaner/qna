require 'rails_helper'

feature 'User can see list of questions', %q{
  In order to get interested question
  As an any user
  I'd like to be able to see questions
} do
  given(:user) { create(:user) }
  given!(:questions) { create_list(:question, 1, user_id: user.id) }

  scenario 'Any user visit to questions' do
    visit questions_path

    expect(page).to have_content 'MyString'
  end
end
