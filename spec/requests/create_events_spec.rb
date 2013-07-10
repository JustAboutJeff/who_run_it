require 'spec_helper'

describe "events" do
  describe "events#index" do
    it "should display a list of events" do
      FactoryGirl.create(:event)
      visit root_path
      expect(page).to have_content("Lincoln Park Run")
    end
  end
end

describe "create event" do
  before do
    FactoryGirl.create(:user)
    visit root_path
    click_link("Login")
    fill_in("session[username]", with: "niles")
    fill_in("session[password]", with: "123456")
    click_button("Login")
    expect(page).to have_content("Username: niles")
  end

  describe "events#new" do
    it "should create a new event" do
      visit new_event_path
      fill_in("event[title]", with: "Lincoln Park Run")
      fill_in("event[description]", with: "Easy 2 mile run along Lake Shore drive")
      # clicks on map to create a start point/route js
      page.select("10", from: "event[pace]")
      # run javascript to select date
      click_button("Create Run")
      expect(page).to have_content("Event Created.")
    end

    it "should ensure a title is added" do
      visit new_event_path
      fill_in("event[description]", with: "Easy 2 mile run along Lake Shore drive")
      # clicks on map to create a start point/route js
      page.select("10", from: "event[pace]")
      # run javascript to select date
      click_button("Create Run")
      expect(page).to have_content("Create Run")
    end

    it "should ensure a description is added" do
      visit new_event_path
      fill_in("event[title]", with: "Lincoln Park Run")
      # clicks on map to create a start point/route js
      page.select("10", from: "event[pace]")
      # run javascript to select date
      click_button("Create Run")
      expect(page).to have_content("Create Run")
    end

    it "should ensure a starting point is added" do
      visit new_event_path
      fill_in("event[title]", with: "Lincoln Park Run")
      fill_in("event[description]", with: "Easy 2 mile run along Lake Shore drive")
      # clicks on map to create a start point/route js
      page.select("10", from: "event[pace]")
      # run javascript to select date
      click_button("Create Run")
      expect(page).to have_content("Create Run")
    end

    it "should ensure a pace is added" do
      visit new_event_path
      fill_in("event[title]", with: "Lincoln Park Run")
      fill_in("event[description]", with: "Easy 2 mile run along Lake Shore drive")
      # clicks on map to create a start point/route js
      # run javascript to select date
      click_button("Create Run")
      expect(page).to have_content("Create Run")
    end

    it "should ensure a start date/time is added" do
      visit new_event_path
      fill_in("event[title]", with: "Lincoln Park Run")
      fill_in("event[description]", with: "Easy 2 mile run along Lake Shore drive")
      # clicks on map to create a start point/route js
      page.select("10", from: "event[pace]")
      click_button("Create Run")
      expect(page).to have_content("Create Run")
    end

  end
end

describe "show event" do
  describe "event#show" do
    it "should show an event created by logged in user" do
      FactoryGirl.create(:user)
      FactoryGirl.create(:event)
      visit login_path
      fill_in("session[username]", with: "niles")
      fill_in("session[password]", with: "1234")
      click_button("Login")
      click_button("Events") #? Dependent on final UX design
      expect(page).to have_content("Lincoln Park Zoo")
    end
  end
end

describe "edit event" do
  describe "event#edit" do
    it "should allow user to edit an event" do
      visit event_path
      click_button("Edit Path")
      page.select("7", from: "event[pace]")
      click_button("Update")
      expect(page).to have_content("Pace: 7 minutes per mile")
    end
  end
end



