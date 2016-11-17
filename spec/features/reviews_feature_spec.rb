require 'rails_helper'

feature 'reviewing' do
  before { Restaurant.create name: 'KFC'}

  scenario 'allows users to leave a review using a form' do
     visit '/'
     click_link('Sign up')
     fill_in('Email', with: 'test@example.com')
     fill_in('Password', with: 'testtest')
     fill_in('Password confirmation', with: 'testtest')
     click_button('Sign up')
     click_link 'Rate KFC'
     fill_in "Thoughts", with: "so so"
     select '3', from: 'Rating'
     click_button 'Leave Review'
     click_link 'KFC'
     expect(page).to have_content('so so')
  end

end
