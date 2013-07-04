require 'spec_helper'

describe User do
  it { should have_many(:events) }
  it { should have_many(:settings) }
  it { should have_many(:locations).through(:settings)}
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_uniqueness_of (:username) }
  it { should validate_uniqueness_of(:email) }

  it { should_not allow_value("meh").for(:email) }
  it { should allow_value("matt@isaboss.com").for(:email) }

  it { should ensure_length_of(:password).is_at_least(4) }
end
