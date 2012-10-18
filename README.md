# This is a practice example for Fever. This is a example solution in Ruby on Rails, for the Zombie Apocalypse problem:

It seems that the Mayans were right and 2012 is going to end abruptly. There is not much
information about how it started, but all the stories about zombies have now became real. You
and your developer friends, thank to all the movies that you have seen on the subject, are alive
in a safe house, but you are running out of food. Bummer! You decide it’s best to implement a
mobile application that will help your friends when they are out there in unsafe zones. The app
will recommend the best place to go in case of emergency, based on the user’s context.
As you can imagine, you are in charge of the server side and you should keep in mind that the
more accurate your recommendations are based on their preferences and individual situations,
the more friends you will save from brain buffet!

# Objects

# Safe house
A “Safe House” represents a place where your friends have been in the past. It is defined by:
● Name: name of the place.
● Probability of zombie appearance: normalized (0.0 1.0).
● Location (latitude/longitude): latitude and longitude coordinates of the place.
● Armory: indicates if there are weapons inside the house.
● Food: indicates if there is food inside the house.
● People: indicates if the place is inhabited by other people.
# Person
A “Person” represents each one of your friends. It is defined by:
● Name: name of the person.
● Location (latitude/longitude): latitude and longitude coordinates of the person.
● Armory: indicates if the person has a weapon.
● Hungry: indicates if the person is hungry.
● Alone: indicates if the person is alone or with a group.

# API definition
# http://localhost:10000/places/create (POST)
Stores a place into the database.
Input parameters
● name [required]: name of the place.
● zombie_probability (Float [0.01.0])
[required]: probability of zombie appearance.
● latitude (Float) [required]: latitude coordinate of the place.
● longitude (Float) [required]: longitude coordinate of the place.
● has_weapons (Boolean) [required]: flag that indicates if the house contains weapons.
● has_food (Boolean) [required]: flag that indicates if the house contains food.
● has_people (Boolean) [required]: flag that indicates if the house is inhabited.
Response
{
“status” : “OK”,
“response” : {
“created” : true
}
}
Error
{
“status” : “Error”,
“response” : {}
}
# http://localhost:10000/users/create (POST)
Stores an user into the database.
Input parameters
● name [required]: Name of the user.
● latitude (Float) [required]: latitude coordinate of the user.
● longitude (Float) [required]: longitude coordinate of the user.
● has_weapon (Boolean) [required]: flag which indicates if the user has a weapon.
● is_hungry (Boolean) [required]: flag which indicates if the user is hungry.
● is_alone (Boolean) [required]: flag that indicates if the user is alone.
Response
{
“status” : “OK”,
“response” : {
“created” : true
}
}
Error
{
“status” : “Error”,
“response” : {}
}
# http://localhost:10000/users/update (PUT)
Updates user information.
Input parameters
● user_id [required]: ID of the user.
● latitude (Float) [optional]: latitude coordinate of the user.
● longitude (Float) [optional]: longitude coordinate of the user.
● has_weapon (Boolean) [optional]: flag that indicates if the user has a weapon.
● is_hungry (Boolean) [optional]: flag that indicates if the user is hungry.
● is_alone (Boolean) [optional]: flag that indicates if the user is alone.
Response
{
“status” : “OK”,
“response” : {
“updated” : true
}
}
Error
{
“status” : “Error”,
“response” : {}
}
# http://localhost:10000/recommendations (GET)
Gets the list of places sort by the recommendation algorithm.
Input parameters
● user_id [required]: ID of the user.
Response
{
“status” : “OK”,
“response” : {
“user” : {
“user_id” : user_id,
“name” : name,
“location” : {
“latitude” : latitude,
“longitude” : longitude
},
“armory” : (true | false),
“hungry” : (true | false),
“alone” : (true | false)
},
“places” : [
{
“place_id” : place_id,
““lnoacmateio” n: ”n :a {me,
“latitude” : latitude,
“longitude” : longitude
},
“armory” : (true | false),
“food” : (true | false),
“people” : (true | false)
},
{
...
},
...
]
}
}
Error
{
“status” : “Error”,
“response” : {}
}

# Requirements
● Use MongoDB or MySQL (persistence strategy).
● You can use any framework/library/gem provided by the standard ruby/python libraries.
Try to not use any other 3rd party framework/library/gem.
● The “weight” of each user or place attribute should be easy to configure. In this first
approach, you should pick the best ones.
● An User Interface is NOT necessary.

#Extra points (not required)
● Include validations for the input parameters.
● In case of error, modify the “Error” status message for a more verbose one.
● Test all the platform.
● If necessary, use a framework/library/gem to perform heavy tasks on background.
● Create “places/update” API call. The response should follow the format of
“users/update”.

# My personal comments
● 2 models and 2 controllers have been created.
● The routes are configured to match the ones of the specs.
● The weights of the attributes for places can be easily adjusted via constants in config/environment.rb
● I have set some values for those weights that give reasonable good results for the examples I had in mind and tested it with
● I assummed that the coordinates are given in meters (m)
● I have done most of the extra points in spare time, but could not do it all (specially tests, which I would like to have had more time for)

