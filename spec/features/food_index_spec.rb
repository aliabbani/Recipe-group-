require 'rails_helper'

RSpec.feature 'Food #Index', type: :feature do
  background do
    visit new_user_session_path

    @user = User.create(name: 'Ali', email: 'ali@mail.com', password: '123456', confirmed_at: Time.now)
    @food = Food.create(name: 'meat', measurement_unit: 'grams', price: 50, user_id: @user.id)

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Log in'
    visit foods_path
  end

  scenario 'show My Foods on page' do
    expect(page).to have_content('meat')
  end

  scenario 'show food details on page' do
    expect(page).to have_content @food.name
    expect(page).to have_content @food.measurement_unit
    expect(page).to have_content @food.price
  end

  scenario 'show Add Food button on page' do
    expect(page).to have_link 'Add Food'
  end

  scenario 'Should display a view button' do
    expect(page).to have_link 'view'
  end

  scenario 'When I click on view, I am redirected to that food\'s show page.' do
    click_link('view')
    expect(page).to have_current_path food_path(@food.id)
  end
end