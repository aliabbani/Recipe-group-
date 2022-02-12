require 'rails_helper'

RSpec.feature 'Recipe index', type: :feature do
  background do
    visit new_user_session_path

    @user = User.create(name: 'Ali', email: 'ali@mail.com', password: '123456', confirmed_at: Time.now)
    @recipe = Recipe.create(name: 'Burger', description: 'american burger', cooking_time: 20, preparation_time: 50,
                            user_id: @user.id)

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Log in'
    visit recipes_path
  end

  scenario 'display all Recipes on page' do
    expect(page).to have_content 'All Recipes'
  end

  scenario 'display recipe details on page' do
    expect(page).to have_content @recipe.name
    expect(page).to have_content @recipe.description
  end

  scenario 'display create your recipe button on page' do
    expect(page).to have_link 'Create Your Recipe'
  end

  scenario 'display a delete button' do
    expect(page).to have_button 'Delete'
  end

  scenario 'When I click on recipe name, I am redirected to that recipe\'s show page.' do
    click_link(@recipe.name)
    expect(page).to have_current_path recipe_path(@recipe.id)
  end
end
