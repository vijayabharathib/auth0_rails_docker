# Rails App on Docker secured with Auth0
---
Staging Build Status: [![Build Status](https://travis-ci.org/vijayabharathib/auth0_rails_docker.svg?branch=staging)](https://github.com/vijayabharathib/auth0_rails_docker/tree/staging)
Master Build Status: [![Build Status](https://travis-ci.org/vijayabharathib/auth0_rails_docker.svg?branch=master)](https://travis-ci.org/vijayabharathib/auth0_rails_docker)
This app is a prototype built on **Ruby on Rails**. It uses `docker` for development workflow. Automatically deploys to Heroku pipeline when there is a new commit to repository, when travis CI test passes.

Heroku provides a staging region and a production region as part of the pipeline. Postgres is available as an add-on.

Heroku staging environment: [https://bookshelfstage.herokuapp.com/]
Heroku production environment: [https://bookstall.herokuapp.com/]

## Getting Started Locally

Follow these steps to run project locally:
1. Ensure you have [docker](https://docs.docker.com/install/) and [docker-compose](https://docs.docker.com/compose/install/) installed.
`docker -v` and `docker-compose -v` should return meaningful results showing versions.
2. Clone the repository using `git clone git@github.com:vijayabharathib/auth0_rails_docker.git` or you can fork and use your own repository.
3. The first time, run this command on a terminal : `docker-compose up --build` while you are inside the project folder. **This may take a while depending on the connection** as it will pull the necessary docker image, initiate the container and install gems required.
4. To ensure you have a local database to work with, you need to create and migrate DB with the help of rails. Run these commands from another terminal while you are inside the project folder
    * Create db tables with `docker-compose run auth0 rails db:create`
    * Apply schema through migrations `docker-compose run auth0 rails db:migrate`
    * Get test environment ready `docker-compose run auth0 rails db:migrate RAILS_ENV=test`
    * Seed the database with `rails db:seed` 
5. At this point, it is better to stop docker container and start again. `docker-compose down` should bring the services down and `docker-compose up` should bring them up again. If you see the log showing `Listening on tcp://0.0.0.0:3000` or something similar, you are good to go.
6. On your browser, point to [http://localhost:3000] to open the app. 
7. Create a login with Auth0 and start creating books and move them between shelves.

## Next steps to be part of post outline
1. create travis-CI hook to test the repository on commit
2. create heroku pipeline (staging and production) to promote code on successful travis test (CI/CD)
