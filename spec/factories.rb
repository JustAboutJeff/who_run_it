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
    start_time "1300"
    pace "7"
    url_key "#"
  end

end
