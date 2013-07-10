require 'spec_helper'

describe LocationSetting do

  it { should belong_to (:user) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:notification_frequency) }
  it { should validate_presence_of(:notification_method) }
  it { should validate_presence_of(:pace_min) }
  it { should validate_presence_of(:pace_max) }
  it { should validate_presence_of(:distance_min) }
  it { should validate_presence_of(:distance_max) }
  it { should validate_presence_of(:longitude) }
  it { should validate_presence_of(:latitude) }

  it { should validate_uniqueness_of(:name).scoped_to(:user_id) }

  describe 'check if a user should be notified by email' do
    it 'should not notify users with default notification (1 - None)' do
      test = FactoryGirl.create(:location_setting)
      expect(test.email?).to eq(false)
    end
  end

  describe 'check if a user should be notified by email' do
    it 'should notify users when notification setting is (2 - Email)' do
      test = FactoryGirl.create(:location_setting)
      test.notification_method = "2"
      expect(test.email?).to eq(true)
    end
  end

  describe 'check if a user should be notified by email' do
    it 'should notify users when notification setting is (4 - Both)' do
      test = FactoryGirl.create(:location_setting)
      test.notification_method = "4"
      expect(test.email?).to eq(true)
    end
  end

  describe 'check if a user should be notified by sms' do
    it 'should not notify users with default notification (1)' do
      test = FactoryGirl.create(:location_setting)
      expect(test.sms?).to eq(false)
    end
  end

  describe 'check if a user should be notified by sms' do
    it 'should not notify users with default notification (3 - SMS)' do
      test = FactoryGirl.create(:location_setting)
      test.notification_method = "3"
      expect(test.sms?).to eq(true)
    end
  end

  describe 'check if a user should be notified by sms' do
    it 'should not notify users with default notification (4 - Both)' do
      test = FactoryGirl.create(:location_setting)
      test.notification_method = "4"
      expect(test.sms?).to eq(true)
    end
  end

end
