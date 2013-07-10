require 'spec_helper'

describe "login" do
  describe "sessions#new" do
    it "should display error with invalid password" do
      visit root_path
      click_link("Login")
      fill_in("session[username]", with: "niles")
      fill_in("session[password]", with: "badpassword")
      click_button("Login")
      expect(page).to have_content("Login")
      #pending "waiting for error code flash message implementation"
    end

    it "should display error with invalid username" do
      visit root_path
      click_link("Login")
      fill_in("session[username]", with: "baduser")
      fill_in("session[password]", with: "password")
      click_button("Login")
      expect(page).to have_content("Login")
      #pending "waiting for error code flash message implementation"
    end

    it "should allow user to login" do
      FactoryGirl.create(:user)
      visit root_path
      click_link("Login")
      fill_in("session[username]", with: "niles")
      fill_in("session[password]", with: "123456")
      click_button("Login")
      expect(page).to have_content("Username: niles")
    end
  end
end

describe "logout" do
  describe "session#destroy" do
    it "should allow user to logout" do
      FactoryGirl.create(:user)
      visit root_path
      click_link("Login")
      fill_in("session[username]", with: "niles")
      fill_in("session[password]", with: "123456")
      click_button("Login")

      click_link("Logout")
      expect(page).to have_content("Login")
    end
  end
end

describe "signup" do
  describe "users#new" do
    it "should allow user to signup" do
      visit new_user_path
      fill_in("user[username]", with: "niles")
      fill_in("user[cellphone]", with: "222-222-2222")
      fill_in("user[email]", with: "jeff@isaboss.com")
      fill_in("user[password]", with: "123456")
      click_button("Sign Up")
      expect(page).to have_content("Username: niles")
    end

    it "should not allow bogus emails" do
      visit new_user_path
      fill_in("user[username]", with: "niles")
      fill_in("user[cellphone]", with: "222-222-2222")
      fill_in("user[email]", with: "meh")
      fill_in("user[password]", with: "123456")
      click_button("Sign Up")
      expect(page).to have_content("Create User")
    end

    it "should not allow bad phone number" do
      visit new_user_path
      fill_in("user[username]", with: "niles")
      fill_in("user[cellphone]", with: "abc-123-1111")
      fill_in("user[email]", with: "jeff@isaboss.com")
      fill_in("user[password]", with: "123456")
      click_button("Sign Up")
      expect(page).to have_content("Create User")
    end

    it "should not allow bad password" do
      visit new_user_path
      fill_in("user[username]", with: "niles")
      fill_in("user[cellphone]", with: "222-222-1111")
      fill_in("user[email]", with: "jeff@isaboss.com")
      fill_in("user[password]", with: "meh")
      click_button("Sign Up")
      expect(page).to have_content("Create User")
    end
  end

end

describe "view profile" do
  describe "users#show" do
    it "should allow user to view profile" do
      FactoryGirl.create(:user)
      visit login_path
      fill_in("session[username]", with: "niles")
      fill_in("session[password]", with: "123456")
      click_button("Login")
      visit profile_path
      expect(page).to have_content("Username: niles")
    end
  end
end
