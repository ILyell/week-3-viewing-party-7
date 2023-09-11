require 'rails_helper'

RSpec.describe 'Landing Page' do
  before :each do 
    @user1 = User.create(name: "User One", email: "user1@test.com", password: "pass12345", password_confirmation: "pass12345")
    @user2 = User.create(name: "User Two", email: "user2@test.com", password: "pass12345", password_confirmation: "pass12345")
    visit '/'
  end 

  it 'has a header' do
    expect(page).to have_content('Viewing Party Lite')
  end

  it 'has links/buttons that link to correct pages' do 
    click_button "Create New User"
    
    expect(current_path).to eq(register_path) 
    
    visit '/'
    click_link "Home"

    expect(current_path).to eq(root_path)
  end 

  it 'lists out existing users' do 
    expect(page).to have_content('Existing Users:')

    within('.existing-users') do 
      expect(page).to have_content(@user1.email)
      expect(page).to have_content(@user2.email)
    end     
  end 

  it 'has a link to log in' do
    
    expect(page).to have_link("Log In")

    click_link("Log In")

    expect(current_path).to eq("/login")
  end

  it 'Shows a log out link if a user is logged in' do

    user = User.create(name: "Ian", email: "funbucket13", password: "test", password_confirmation: "test")

    visit root_path

    click_on "Log In"

    expect(current_path).to eq('/login')

    fill_in :email, with: user.email
    fill_in :password, with: user.password

    click_on "Log In"

    expect(current_path).to eq(root_path)

    expect(page).to have_link("Log Out")

  end
end
