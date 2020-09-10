#here i will create some seed data to work with and test out associations.

#create 2 CreateUsersTable

jamblin = User.create(password: "password", email: "jamblin@flatiron.com", username: "Jamblin")
chris =User.create(password: "password", email: "chris@flatiron.com", username: "Chris")


#create some games
Game.create(name: "Tony Hawk Pro Skater 2")
Game.create(name: "The Last of Us 2")
#create some consoles
Console.create(name: "Playstation 4", user_id: jamblin.id, year_purchased: 2014, year_released: 2013)
Console.create(name: "Playstation 4", user_id: chris.id, year_purchased: 2013, year_released: 2013)
Console.create(name: "Nintendo Switch", user_id: chris.id, year_purchased: 2018, year_released: 2017)
Console.create(name: "Playston", user_id: jamblin.id, year_purchased: 1995, year_released: 1994)

#AR to pre-associate data:

chris.games.create(name: "Skyrim", year_purchased: 2011)
