FactoryGirl.define do

  factory :user do
    username "niles"
    password "123456"
    email "niles@nilesrocks.com"
    cellphone "222-222-2222"
  end

  factory :event do
    user_id 1
    title "Lincoln Park Run"
    description "Easy run along lakeshore drive"
    route_id 1
    start_time "2013-07-10 17:08:23 -0500"
    pace 7
    url_key "#"
  end

  factory :location_setting do
    name "home"
    notification_frequency 1
    notification_method 1
    pace_min 8
    pace_max 10
    distance_min 0
    distance_max 1
    latitude 105.000
    longitude -44.000
    address "123 Main Street, Kalamazoo, MI"
  end

  factory :waypoint do
    route_id 1
    position 1
    latitude -105.00000
    longitude 44.0000000
  end

end
