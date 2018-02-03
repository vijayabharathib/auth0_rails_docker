# Rails App on Docker secured with Auth0

This app is a prototype built on **Ruby on Rails**. It uses `docker` for development workflow. Automatically deploys to Heroku pipeline when there is a new commit to repository.

Heroku provides a staging region and a production region as part of the pipeline. Postgres is available as an add-on.

## Setup Docker

## Create Rails App

## Setup Database
docker-compose run auth0 rails db:create
docker-compose run auth0 rails db:migrate
docker-compose run auth0 rails db:migrate RAILS_ENV=test
* database seeding
## Setup Tests
*setup tests
docker-compose run auth0 rails test

# Heroku Setup instructions

create a new pipeline
Create a postgres addon
That creates a DATABASE_URL config var
while creating it, connect to github repository
add an app to staging first
enable automatic deploy
deploy manually once
Use that "DATABASE_URL" var within database.yml
run "rails db:migrate" within console given in heroku
Change the code and commit
It should trigger a build
Use the log menu under options to check logs

* ...

