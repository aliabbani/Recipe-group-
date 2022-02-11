require 'rails_helper'

RSpec.describe RecipesController, type: :routing do
    describe 'recipe routing' do
      it 'recipes index route' do
        expect(get: '/recipes').to route_to('recipes#index')
      end
  
      it 'new recipes routes' do
        expect(get: '/recipes/new').to route_to('recipes#new')
      end
  
      it 'create recipes route' do
        expect(post: '/recipes').to route_to('recipes#create')
      end
  
      it 'destroy recipes routes' do
        expect(delete: '/recipes/1').to route_to('recipes#destroy', id: '1')
      end
    end
  end
  