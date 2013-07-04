FactoryGirl.define do

  factory :user do
    username "niles"
    password "1234"
    email "niles@nilesrocks.com"
    cellphone "222-222-2222"
  end

  factory :event do
    user_id "1"
    title "Lincoln Park Run"
    description "Easy run along lakeshore drive"
    location_id "1"
    start_time "2013-07-04 17:08:23 -0500"
    pace "7"
    url_key "#"
  end

end
