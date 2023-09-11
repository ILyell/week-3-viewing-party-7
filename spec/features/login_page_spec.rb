require 'rails_helper'

RSpec.describe "Logging In" do
    
    it "can log in with valid credentials" do
        user = User.create(name: "Ian", email: "funbucket13", password: "test", password_confirmation: "test")

        visit root_path

        click_on "Log In"

        expect(current_path).to eq('/login')

        fill_in :email, with: user.email
        fill_in :password, with: user.password

        click_on "Log In"

        expect(current_path).to eq(root_path)

        expect(page).to have_content("Welcome, #{user.name}")
    end

    it "cannot log in with bad credentials" do
        user = User.create(name: "Ian", email: "funbucket13", password: "test", password_confirmation: "test")

        visit root_path

        click_on "Log In"
        
        
        fill_in :email, with: user.email
        fill_in :password, with: "incorrect password"
        
        click_on "Log In"
        
        expect(current_path).to eq(login_path)
        
        expect(page).to have_content("Bad Credentials")
    end
end