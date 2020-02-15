# Mini Jeopardy!

### Overview
This is a demo app that fetches and displays questions and their respective point values from the [jservice API](http://www.jservice.io/). Presently, it will randomly choose 5 questions (one for each point value) from the "Science" category from episodes of Jeopardy! aired in 1996, and display them on the `/science_questions` page.

### Local Setup
To get started locally, ensure your machine can run Ruby 2.6.0, then clone this repo and make it your working directory:
```
git clone https://github.com/jpfriedman18/mini-jeopardy.git
cd ./mini-jeopardy
```
then nstall dependencies using Bundler:
```
bundle install
```
and that's it! There is currently no database in this app, so no need to run any migrations.

To start the app locally, simply run
```
rails s
```
and you will then be able to visit `http://localhost:3000/science_questions/` in your browser.
### Notes
This repo is for evaulation purposes for a specific job application.
