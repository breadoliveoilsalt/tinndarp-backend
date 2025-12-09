[![Build Status](https://travis-ci.com/breadoliveoilsalt/tinndarp-backend.svg?branch=master)](https://travis-ci.com/breadoliveoilsalt/tinndarp-backend)

# TINNDARP Backend

Link to app on Heroku: https://tinndarp-backend.herokuapp.com/

This project was bootstrapped with [Ruby on Rails](https://rubyonrails.org/).

## To run the app in development mode:

1. Fork it in GitHub and clone the master branch to your computer.

2. In your terminal, `cd` into the root directory of the app.

3. Run `bundle install` to download dependencies.

4. Download PostgreSQL and set up the database:

    - Create and migrate the development database: `rails db:create db:migrate`
    - Create and prepare the test database: `RAILS_ENV=test rails db:create db:migrate`

5. Run `rake startDev`. The app will start on port 3001.

## To run unit tests:

After step 4 above (database setup):

-   Run `rake test`.

Note: If you get a "database does not exist" error, make sure you've run the database setup commands in step 4.
