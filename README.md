# Rails App on Docker secured with Auth0
---
[![Build Status](https://travis-ci.org/vijayabharathib/auth0_rails_docker.svg?branch=staging)](https://travis-ci.org/vijayabharathib/auth0_rails_docker)

This app is a prototype built on **Ruby on Rails**. It uses `docker` for development workflow. Automatically deploys to Heroku pipeline when there is a new commit to repository.

Heroku provides a staging region and a production region as part of the pipeline. Postgres is available as an add-on.

## Setup Docker
* Use docker image from starefossen/ruby-node:2-8-slim
* explain lines in Dockerfile , the importance of their position in quickly running a container
* explain function of docker-compose.yml

## Create Rails App
* create a container with empty Gemfile
* docker-compose run auth0 rails new . --force --database=postgresql
* explain docker-compose run 
* build project again `docker-compose up --build` to make use of the new Gemfile 

## Setup Database
docker-compose run auth0 rails db:create
docker-compose run auth0 rails db:migrate
docker-compose run auth0 rails db:migrate RAILS_ENV=test
* database seeding

## rails console on docker
dc run --rm auth0 /bin/bash
rails c

## Setup Tests
* setup tests
docker-compose run --rm auth0 rails test
* tests fail initially, as necessary dependencies are not set up between models. `dependent: :destroy` solved it and tests started passing

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
There is no 'post deployment' script to automate 'db:migrate' yet
## Travis Setup
* add .travis.yml
* create a separate database.yml file for travis (as the original one uses local test environment on docker, host name wouldn't match)
* postgres should be added as a service to travis
* before script can be used to create database
* db:migrate is required as first script before test runs (to create a working database copy)

## Secure the app with Auth0
1. Sign up
2. Create a domain (tugboat)
3. Create a client (bookstalldev)
4. Add env variables to docker (not working)
5. set callback URLs
6. install gem dependencies (dc up --build)
7. setup initializer middleware (auth0)
8. add controllers for auth0 callback `rails generate controller auth0 callback failure --skip-template-engine --skip-assets`
9. amend controllers to handle success and failure (if ownership of the file is not with you, `chown`)
10. add routes to handle success and failure
11. add sessions helper
12. add controller for home to host login button `dc run --rm --user $(id -u):$(id -g) auth0 rails generate controller home`
13. add a concern for 'secured'
14. dashboard controller to respond to successful login
15. url mismatch
Callback URL mismatch.
The url "http://localhost:3000/auth/oauth2/callback" is not in the list of allowed callback URLs: http://localhost:3000/auth/auth0/callback.
16. update dashboard with user info
17. *MISSING EMAIL* fixed by including email to the scope within the auth0.rb initializer.
18. add logout controller
19. logout controller does not work as `secret.yml` needs to be updated with auth0 entries.

## Get Shelf Up
dc run --rm --user $(id -u):$(id -g) auth0 rails g model User email:string
dc run --rm --user $(id -u):$(id -g) auth0 rails g resource Shelf type:integer user:references book:references

dc run --rm --user $(id -u):$(id -g) auth0 rails db:migrate 

## Fine Tune
* style app with scss
* set up a short menu
* make it usable

## Security
Change the SECRET_KEY tokens used in snapshots/source codes. Especially for prod, use Heroku env variables

## Offline development
When you are not connected, it is difficult to develop (if your app needs authentication).
