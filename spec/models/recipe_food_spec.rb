require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  describe 'RecipeFood validation tests' do
    subject { RecipeFood.new(quantity: 2, recipe_id: 1, food_id: 1) }
    before { subject.save }

    it 'food_id should be present' do
      subject.food_id = nil
      expect(subject).to_not be_valid
    end

    it 'quantity should be present' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it 'quantity should be greater 0' do
      subject.quantity = -1
      expect(subject).to_not be_valid
    end
  end
end
