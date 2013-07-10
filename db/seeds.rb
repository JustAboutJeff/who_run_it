User.create(username: "matt", password: "123456", email: "mthoover1@gmail.com", cellphone: "(847)707-6295")
User.create(username: "mark", password: "123456", email: "mmorris00@mac.com", cellphone: "9702155852")
User.create(username: "jeff", password: "123456", email: "justaboutjeff@gmail.com", cellphone: "1-440-865-6205")

LocationSetting.create(user_id: 1, name: 'Home', notification_frequency: 1, notification_method: 4, pace_min: 0, pace_max: 12, distance_min: 0, distance_max: 20, latitude: 41.9324624, longitude: -87.6594798, search_radius: 1.0)
LocationSetting.create(user_id: 2, name: 'Home', notification_frequency: 1, notification_method: 4, pace_min: 0, pace_max: 12, distance_min: 0, distance_max: 20, latitude: 40.5852602, longitude: -105.084423, search_radius: 2.0)
LocationSetting.create(user_id: 3, name: 'Home', notification_frequency: 1, notification_method: 4, pace_min: 0, pace_max: 12, distance_min: 0, distance_max: 20, latitude: 39.9611755, longitude: -82.9987941, search_radius: 2.0)

LocationSetting.create(user_id: 1, name: 'Work', notification_frequency: 1, notification_method: 4, pace_min: 0, pace_max: 12, distance_min: 0, distance_max: 20, latitude: 41.8894509, longitude: -87.6371453, search_radius: 2.0)
LocationSetting.create(user_id: 2, name: 'Work', notification_frequency: 1, notification_method: 4, pace_min: 0, pace_max: 12, distance_min: 0, distance_max: 20, latitude: 41.8894509, longitude: -87.6371453, search_radius: 2.0)
LocationSetting.create(user_id: 3, name: 'Work', notification_frequency: 1, notification_method: 4, pace_min: 0, pace_max: 12, distance_min: 0, distance_max: 20, latitude: 41.8894509, longitude: -87.6371453, search_radius: 2.0)
