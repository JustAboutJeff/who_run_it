User.create(username: "matt", password: "1234", email: "mthoover1@gmail.com")
User.create(username: "mark", password: "1234", email: "mmorris00@mac.com")
User.create(username: "jeff", password: "1234", email: "justaboutjeff@gmail.com")

LocationSetting.create(user_id: 1, name: 'Home', latitude: 41.9324624, longitude: -87.6594798)
LocationSetting.create(user_id: 2, name: 'Home', latitude: 40.5852602, longitude: -105.084423)
LocationSetting.create(user_id: 3, name: 'Home', latitude: 39.9611755, longitude: -82.9987941)

LocationSetting.create(user_id: 1, name: 'Work', latitude: 41.8894509, longitude: -87.6371453)
LocationSetting.create(user_id: 2, name: 'Work', latitude: 41.8894509, longitude: -87.6371453)
LocationSetting.create(user_id: 3, name: 'Work', latitude: 41.8894509, longitude: -87.6371453)
