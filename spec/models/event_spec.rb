require 'spec_helper'

describe Event do
  it { should belong_to(:user) }
  it { should belong_to(:route) }

  it { should validate_presence_of (:user_id) }
  it { should validate_presence_of (:title) }
  it { should validate_presence_of (:route_id) }
  it { should validate_presence_of (:start_time) }
  it { should validate_presence_of (:pace) }

  it { should have_many(:waypoints).through(:route) }
  it { should have_many(:notifications) }
  it { should have_many(:users).through(:notifications) }

  it { should ensure_length_of(:title).is_at_most(30) }
  it { should ensure_length_of(:description).is_at_most(100) }

  describe 'Event#generate_time' do
    it 'should return a date one day ahead if time scheduled is less than current time' do
      expect(Event.generate_time(11,30, "AM")).to eq("2013-07-11 11:30:00 -0500")
    end
  end

  describe 'event#create_notifications' do
    # Build
    it 'generate a array of users to be notified' do
    end
  end

  describe 'event#send_notifications' do
    it '' do
    end
  end

  describe 'event#waypoint_coordinates' do
    it 'creates an array from a waypoint object' do
      # waypoint = FactoryGirl.create(:waypoint)
      route_with_waypoint = FactoryGirl.create(:route_with_waypoint)
      event = FactoryGirl.create(:event, :route => route_with_waypoint)
      # event.waypoints << waypoint

      expect(event.waypoint_coordinates).size.to equal(2)
    end
  end

  describe 'event#to_param' do
    it '' do
    end
  end

end
