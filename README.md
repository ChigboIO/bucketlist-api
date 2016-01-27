# eBucketlist API
[![Circle CI](https://circleci.com/gh/andela-echigbo/bucketlist-api.svg?style=svg)](https://circleci.com/gh/andela-echigbo/bucketlist-api) [![Coverage Status](https://coveralls.io/repos/github/andela-echigbo/bucketlist-api/badge.svg?branch=master)](https://coveralls.io/github/andela-echigbo/bucketlist-api?branch=master) [![Code Climate](https://codeclimate.com/github/andela-echigbo/bucketlist-api/badges/gpa.svg)](https://codeclimate.com/github/andela-echigbo/bucketlist-api)

## Introduction
eBucketlist API is a simple API for bucketlist design. It provides an application interface that enables users to create and manage their bucketlists. A user can have many bucketlist. Each bucketlist can have many items. Bucketlists are initialized with a name. Items are stored under bucketlists, with a name and a `done` status indicating whether Item is completed or not.

Every operations are are secured to a registered user's access. This mean that every action is performed on a particular (logged in) user.

This API uses JWT authentication to validate a request. That is to say that every request to the API is sent with an authentication token which is gotten when a user logs in for the first time.

For full documentation, and usage examples, see http://ebucketlist-staging.herokuapp.com/

## Available endpoints.

| EndPoint                                |   Functionality                      |
| --------------------------------------- | ------------------------------------:|
| POST /auth/login                        | Logs a user in                       |
| GET /auth/logout                        | Logs a user out                      |
| POST /bucketlists/                      | Create a new bucket list             |
| GET /bucketlists/                       | List all the created bucket lists    |
| GET /bucketlists/:id                    | Get single bucket list               |
| PUT /bucketlists/:id                    | Update this bucket list              |
| DELETE /bucketlists/:id                 | Delete this single bucket list       |
| POST /bucketlists/:id/items/            | Create a new item in bucket list     |
| PUT /bucketlists/:id/items/:item_id     | Update a bucket list items           |
| DELETE /bucketlists/:id/items/:item_id  | Delete an item in a bucket lists     |
| POST /users/                            | Create a new user                    |

## Versioning
Changes and upgrades are made from time to time in this API. So that a consumer's code does not break, the major changes are made as a different version. We have provided three ways of specifying the requested version, these are listed below:

By specifying the version in the url path
        GET /api/v1/<some-endpoint>

By passing the `Accept` header stating the version in your request
```ruby
{'Accept' => 'application/vnd.mycompany.com; version=1'}
```

By passing the `version` parameter to the url
        GET /api/<some-endpoint>?version=v1

Also, if the version is not passed in anyway, the requests defaults to version 1.

## Limitations
The API only responds with json, and does not yet have support for xml and other response types.

## Installation
Web application is written with Ruby using the Ruby on Rails API framework.

To install Ruby visit [Ruby Lang](https://www.ruby-lang.org).

To install Rails visit [Ruby on Rails](http://rubyonrails.org/).

To install Rails visit [Rails API](https://github.com/rails-api/rails-api).

## Dependencies
User authentication is implemented with the JWT gem. For more information, see https://github.com/jwt/ruby-jwt

ActiveModelSerializer was used while serializing objects for JSON responses. See https://github.com/rails-api/active_model_serializers

## Testing

Before running tests, run the following command to run all database migrations:

        $ bundle exec rake db:migrate

Before running tests, run the following command to seed the database:

        $ bundle exec rake db:seed

To test the web application, run the following command to carry out all tests:

        $ bundle exec rake spec

To view test descriptors, run the following command:

        $ bundle exec rake spec -fd

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/andela-echigbo/bucketlist-api. This project is intended to be a safe and welcoming space for collaboration. To contribute to this work:

1. Fork it ( https://github.com/[andela-echigbo]/bucketlist-api/fork )

2. Create your feature branch (`git checkout -b my-new-awesome-feature`)

3. Commit your changes (`git commit -am 'Add some awesome feature'`)

4. Push to the branch (`git push origin my-new-awesome-feature`)

5. Create a new Pull Request

6. Wait
