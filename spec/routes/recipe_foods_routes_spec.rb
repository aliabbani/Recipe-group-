require 'rails_helper'

RSpec.describe RecipeFoodsController, type: :routing do
    describe 'recipe_foods routing' do
      it 'recipe_foods index route' do
        expect(get: 'recipes/1/recipe_foods').to route_to('recipe_foods#index', recipe_id: '1')
      end
  
      it 'new recipe_foods routes' do
        expect(get: 'recipes/1/recipe_foods/new').to route_to('recipe_foods#new', recipe_id: '1')
      end
  
      it 'create recipe_foods route' do
        expect(post: 'recipes/1/recipe_foods').to route_to('recipe_foods#create', recipe_id: '1')
      end
  
      it 'destroy recipe_foods routes' do
        expect(delete: 'recipes/1/recipe_foods/1').to route_to('recipe_foods#destroy', recipe_id: '1', id: '1')
      end
    end
  end
  