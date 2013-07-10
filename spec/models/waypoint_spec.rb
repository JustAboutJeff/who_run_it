require 'spec_helper'

describe Waypoint do
  it { should belong_to(:route) }

  it { should validate_presence_of(:route_id) }
  it { should validate_presence_of(:position) }
  it { should validate_presence_of(:latitude) }
  it { should validate_presence_of(:longitude) }
end
