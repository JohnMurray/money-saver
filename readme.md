# Saving For Stuff

This is a simple personal-savings app that allows you to pick items that
you would like to buy and contribute dollar amounts towards the total every
time you save money (eg. not eating out one night you typically would).

It's a very simple application and you can get it setup via the following
instructions below.

## Installation

First you have to install Postgres.app and Ruby on your computer. Then 
download this app, `cd` to it, and install the gems.

	$ bundle install

To run the app locally, install Shotgun and run

	$ shotgun config.ru

Your app should then be running at `http://localhost:9393`.

## Heroku App Creation

Heroku relies on [Git](http://devcenter.heroku.com/articles/git) 
for deploying apps so initialize git for the app.

	$ git init
	$ git add .
	$ git commit -m "Initial Commit"

To create a Heroku app, first be sure you are 
[signed up](https://api.heroku.com/signup). Then type the following in 
the terminal while inside of the project directory.

	$ heroku create NAME_OF_YOUR_APP

Once this returns successfully, push your app to Heroku.

	$ git push heroku master

## Heroku Database Creation

You'll need to add a database to Heroku. Currently I setup the project to use
a postgres database, so you can use the free version and you can do the following:

	$ heroku addons:add heroku-postgresql:dev
	$ heroku pg:promote [HEROKU_POSTGRESQL_REPLACEME_URL]

Now you've created your database. Now you need to update the tables:

	$ heroku run console
	$ require './app.rb'
	$ DataMapper.auto_upgrade!
	$ exit
