require 'spec_helper'

describe Location do
  it { should have_many(:settings) }
  it { should have_many(:events) }
  it { should validate_presence_of(:latitude) }
  it { should validate_presence_of(:longitude) }
  it { should callback(:round_values).before(:save) }
end
