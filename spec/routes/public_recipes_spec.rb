require 'rails_helper'

RSpec.describe PublicRecipesController, type: :routing do
    describe 'Public Recipes Routing' do
      it 'public_recipes index route' do
        expect(get: '/public_recipes').to route_to('public_recipes#index')
      end
    end
  end
  