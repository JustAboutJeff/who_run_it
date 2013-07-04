require 'spec_helper'

describe Event do
  it { should belong_to(:user) }
  it { should belong_to(:location) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of (:title) }
  it { should validate_presence_of (:location_id) }
  it { should validate_presence_of (:start_time) }
end
