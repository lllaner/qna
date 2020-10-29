require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:answers).class_name('Answer') }
    it { should have_many(:questions).class_name('Question') }
  end

  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
  end

  describe '#is_author?' do
    let(:user) { create(:user) }
    let(:question) { create(:question,user_id: user.id) }
    let(:answer) { create(:answer, question_id: question.id, user_id: user.id) }

    it 'author verify resource' do
      expect(user.author?(answer)).to eq true
    end

    it 'user verify resource' do
      expect(User.new.author?(answer)).to eq false
    end
  end
end
