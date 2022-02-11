require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'Recipe validation tests' do
    subject do
      @user1 = User.new(name: 'Ali', email: 'ali@mail.com', password: '123456', confirmed_at: Time.now)
      @user1.recipes.new(user_id: @user1.id, name: 'meat', preparation_time: 45, cooking_time: 30,
                         description: 'lorem', public: true)
    end
    before { subject.save }

    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'preparation_time should be present' do
      subject.preparation_time = nil
      expect(subject).to_not be_valid
    end

    it 'cooking_time should be present' do
      subject.cooking_time = nil
      expect(subject).to_not be_valid
    end

    it 'description should be present' do
      subject.description = nil
      expect(subject).to_not be_valid
    end

    it 'preparation_time should be integer' do
      subject.preparation_time = 30
      expect(subject).to be_valid
    end

    it 'preparation_time should be greater 0' do
      subject.preparation_time = -1
      expect(subject).to_not be_valid
    end

    it 'cooking_time should be integer' do
      subject.cooking_time = 30
      expect(subject).to be_valid
    end

    it 'cooking_time should be greater 0' do
      subject.cooking_time = -1
      expect(subject).to_not be_valid
    end
  end
end
