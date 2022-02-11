require 'rails_helper'

RSpec.describe FoodsController, type: :routing do
    describe 'food routing' do
      it 'foods index route' do
        expect(get: '/').to route_to('foods#index')
      end
  
      it 'new foods routes' do
        expect(get: '/foods/new').to route_to('foods#new')
      end
  
      it 'create food routes' do
        expect(post: '/foods').to route_to('foods#create')
      end
  
      it 'destroy food routes' do
        expect(delete: '/foods/1').to route_to('foods#destroy', id: '1')
      end
    end
  end
  