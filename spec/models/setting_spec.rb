require 'spec_helper'

describe Setting do
  it { should belong_to(:user) }
  it { should belong_to(:location) }
end
