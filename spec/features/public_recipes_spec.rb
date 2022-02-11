require 'rails_helper'

RSpec.feature 'Public Recipe', type: :feature do
  background do
    visit new_user_session_path

    @user = User.create(name: 'Ali', email: 'ali@mail.com', password: '123456', confirmed_at: Time.now)
    @recipe = Recipe.create(name: 'burger', description: 'american burger', cooking_time: 10, preparation_time: 20,
                            public: true, user_id: @user.id)

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Log in'
    visit public_recipes_path
  end

  scenario 'display recipe details on page' do
    expect(page).to have_content 'Public Recipes'
    expect(page).to have_content @recipe.name
    expect(page).to have_content @user.name
    expect(page).to have_content('Total food items:')
    expect(page).to have_content('Total price:')
  end

  scenario 'display public status as true' do
    expect(@recipe.public).to be_truthy
  end
end
