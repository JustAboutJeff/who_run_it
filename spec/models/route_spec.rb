require 'spec_helper'

describe Route do

 it { should have_many(:events) }
 it { should have_many(:waypoints) }

 it { should validate_presence_of(:name) }
 it { should validate_presence_of(:distance) }

 it { should ensure_length_of(:name).is_at_most(30) }
 it { should ensure_inclusion_of(:saved).in_range(0..1) }

end
