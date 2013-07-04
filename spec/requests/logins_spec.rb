require 'spec_helper'

describe "login" do
  describe "sessions#new" do
    it "should allow user to login" do
      FactoryGirl.create(:user)
      # TODO: user should be able to login from home page
      visit login_path
      fill_in("session[username]", with: "niles")
      fill_in("session[password]", with: "1234")
      click_button("Login")
      expect(page).to have_content("Username: niles")
    end
  end
end

describe "logout" do
  describe "session#destroy" do
    it "should allow user to logout" do
      visit logout_path
      # TODO: show that user is logged out
    end
  end
end

describe "signup" do
  describe "users#new" do
    it "should allow user to signup" do
      visit root_path
      fill_in("user[username]", with: "niles")
      fill_in("user[cellphone]", with: "222-222-2222")
      fill_in("user[email]", with: "jeff@isaboss.com")
      fill_in("user[password]", with: "1234")
      click_button("Sign Up")
      expect(page).to have_content("Username: niles")
    end
  end

  # TODO Check validations with invalid emails, duplicate usernames, etc..
end

describe "view profile" do
  describe "users#show" do
    it "should allow user to view profile" do
      FactoryGirl.create(:user)
      visit login_path
      fill_in("session[username]", with: "niles")
      fill_in("session[password]", with: "1234")
      click_button("Login")
      visit profile_path
      expect(page).to have_content("Username: niles")
    end
  end
end
