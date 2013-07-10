require 'spec_helper'

describe Notification do

  it { should belong_to (:user) }
  it { should belong_to (:event) }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:event_id) }

  it { should ensure_inclusion_of(:committed).in_range(0..1) }

  it { should validate_uniqueness_of(:user_id).scoped_to(:event_id) }

end
