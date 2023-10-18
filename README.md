# README

This is an API that can help with keeping track of gaming backlogs.

Here are some of the goals that I would like to accomplish as I continue to work on this project:
- Integration with a gaming database to pull in stock photos and information on the games.
- Integration with Howlongtobeat in order to see how long each game could potentially take.
- User ability to create a backlog based off of games they own.
- Ability to create a schedule based off of how much time you have each day/week/month in order to try and get through the backlog.
- Random game chooser which you can use filters to specify what you are in the mood to play.
- Schedule of all the upcoming games you have planned.

# Pull Requests

TODO: Note make sure all the unit tests pass when creating a PR as they will run on each pull request.

# Configuration

# Database creation

Make sure the database is running and that the port is correctly set in the `config/database.yml` file.  

Run 
- `rails db:create` 
- `rails db:migrate`

Verify there are no errors.

# How to run the test suite
`bundle exec rspec`

## Gernerating fake data using Faker
Go [here](https://github.com/faker-ruby/faker#generators) to see all the API list of generators.

# Deployment instructions
TODO

# How to access the API
Follow this PR in order to get all the information needed to test the API [here](https://github.com/jpitsch/backlog_attack/pull/3#issue-1654557373)
