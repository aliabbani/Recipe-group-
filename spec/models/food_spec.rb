require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'Food validation tests' do
    subject do 
        @user1 = User.new(name: 'Ali', email: 'ali@mail.com', password: '123456', confirmed_at: Time.now) 
        @user1.foods.new(user_id: @user1.id, name: 'meat', measurement_unit: 'gram', price: 10) 
    end
    before { subject.save }

    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'measurement_unit should be present' do
        subject.measurement_unit = nil
        expect(subject).to_not be_valid
    end

    it 'price should be present' do
        subject.price = nil
        expect(subject).to_not be_valid
      end

    it 'price should be integer' do
      subject.price = 3
      expect(subject).to be_valid
    end

    it 'price should be greater 0' do
      subject.price = -1
      expect(subject).to_not be_valid
    end
  end
end