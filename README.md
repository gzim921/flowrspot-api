# FlowrSpot v.2

## Synopsis

**FlowrSpot v.2** is Backend Rails Api that communicates with mobile app via JSON (format) also is a working version of a product FlowrSpot.
This app is used while traveling, hiking spotting flowers. You can check out different flowers ( in details ) also ca post a sighting of that flower, can see others sightings, like them, delete yours etc...

## Setup

### Requirements

Install these software first

* Ruby ( recommended version => '2.6.6' )
* Rails ( recommended versiion => '6.1.3', must be in '>= 6.1.3.2' )
* PostgreSql version => '1.1'
* Redis Server version => '6.0.6'
* Bundler version => '2.1.4'

### Installation
Once you clone this project from github or download it, make sure you run `update bundler` also after that `bundle install` to make sure every gem is successfully installed and ready to use.

## Starting the application

First thing use have to do is:
`rails db:migrate, rails db:create & rails db:seed`
 After configuring database you can start redis by typing: `redis-server` in case it gives problems starting server, you can also ignore that.

Before running the server i recommend you tu run:
    `rails routes` -> to see every possible route that you want to request.

After that you can start by typing in terminal:
    `rails server` -> to run the server ( check 'localhost:3000/routes')

### Example API Requests

#### Requesting to login as user
```
#=>
POST /login
Required Headers:
{
    'Content-Type': 'application/json',
    'Authorization': 'Bearer #{token}'
}
Required Body:
{
    'email': 'test@gmail.com',
    'password': 'test123'
}
#=> Example Response
{
    "user": {
        "id": 22,
        "username": "Testing",
        "email": "test@gmail.com",
        "password": "test"
    },
    "token": "#{token}"
}
```


#### Requsting to see all flowers
```
#=> Example Request
GET /flowers
#=> Example Response
{
    "flowers": [
        {
            "id": 1,
            "name": "Rose",
            "description": "The best flower ever"
        },
        {
            "id": 2,
            "name": "Rose2",
            "description": "The second best flower ever"
        },
        // ....
    ]
}
```

## Running tests

For testing i have user RSpec framework version `4.0.1`

To run all tests run:
`$ rspec` 

### Nesseccary gems used for testing


*   gem 'rspec-rails', '~> 4.0.1'
*   gem 'rspec-json_expectations' ->  helper for json testing
*   gem 'rspec-json_matchers' -> helper for json testing
*   gem 'airborne' -> helper for json testing
*   gem 'factory_bot_rails' -> for creating factories ( model testing )
*   gem 'shoulda-matchers', '~> 4.0' 