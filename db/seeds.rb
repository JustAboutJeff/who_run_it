User.create(username: "matt", password: "1234", email: "mthoover1@gmail.com", cellphone: "(847)707-6295")
User.create(username: "mark", password: "1234", email: "mmorris00@mac.com", cellphone: "9702155852")
User.create(username: "jeff", password: "1234", email: "justaboutjeff@gmail.com", cellphone: "1-440-865-6205")

LocationSetting.create(user_id: 1, name: 'Home', notification_frequency: 1, notification_method: 4, latitude: 41.9324624, longitude: -87.6594798)
LocationSetting.create(user_id: 2, name: 'Home', notification_frequency: 1, notification_method: 4, latitude: 40.5852602, longitude: -105.084423)
LocationSetting.create(user_id: 3, name: 'Home', notification_frequency: 1, notification_method: 4, latitude: 39.9611755, longitude: -82.9987941)

LocationSetting.create(user_id: 1, name: 'Work', notification_frequency: 1, notification_method: 4, latitude: 41.8894509, longitude: -87.6371453)
LocationSetting.create(user_id: 2, name: 'Work', notification_frequency: 1, notification_method: 4, latitude: 41.8894509, longitude: -87.6371453)
LocationSetting.create(user_id: 3, name: 'Work', notification_frequency: 1, notification_method: 4, latitude: 41.8894509, longitude: -87.6371453)
