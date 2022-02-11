require 'rails_helper'

RSpec.feature 'Recipe #Show', type: :feature do
  background do
    visit new_user_session_path

    @user = User.create(name: 'Ali', email: 'ali@mail.com', password: '123456', confirmed_at: Time.now)
    @recipe = Recipe.create(name: 'Burger', description: 'american burger', cooking_time: 20, preparation_time: 50,
                            user_id: @user.id)

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Log in'
    visit recipe_path(@recipe.id)
  end

  scenario 'display recipe details on page' do
    expect(page).to have_content @recipe.name
    expect(page).to have_content @recipe.description
    expect(page).to have_content @recipe.cooking_time
    expect(page).to have_content @recipe.preparation_time
  end

  scenario 'display table details on page' do
    expect(page).to have_content('Food')
    expect(page).to have_content('Quantity')
    expect(page).to have_content('Value')
    expect(page).to have_content('Action')
  end

  scenario 'display buttons on page' do
    expect(page).to have_link 'Generate shoping list'
    expect(page).to have_link 'Add Ingredient'
  end

  scenario 'When I click on burger, I am redirected to that recipe\'s show page.' do
    click_link('Add Ingredient')
    expect(page).to have_current_path new_recipe_recipe_food_path(@recipe.id)
  end
end