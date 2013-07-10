require 'spec_helper'

describe User do
  it { should have_many(:events) }
  it { should have_many(:routes).through(:events) }
  it { should have_many(:location_settings) }
  it { should have_many(:notifications) }
  it { should have_many(:notified_events).through(:notifications) }

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }

  it { should_not allow_value("meh").for(:email) }
  it { should allow_value("matt@isaboss.com").for(:email) }

  it { should ensure_length_of(:password).is_at_least(6) }
  it { should validate_presence_of(:password) }

  context 'given an email' do
    it 'should call get_gravatar_hash before save' do
      user = User.new(username: "test",
                      password: "123456",
                      email: "test@test.com",
                      cellphone: "222-222-2222")

      user.gravatar_hash.should be_nil
      user.save!
      user.gravatar_hash.should_not be_nil
    end
  end

  context 'given a phone number' do
    it 'should call format_phone_number before save' do
      user = User.new(username: "test",
                      password: "123456",
                      email: "test@test.com",
                      cellphone: "222-222-2222")

      user.cellphone.should include("-")
      user.save
      user.cellphone.should_not include("-")
    end
  end

end
