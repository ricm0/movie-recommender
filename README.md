# Movie Recommender

This is a simple movie recommendation engine written in Ruby. It uses user's movie preferences data to generate movie recommendations based on cosine similarity.

## Prerequisites

You need Ruby version 2.7.0 or higher to run this application. The required libraries are 'json' and 'matrix', which come with Ruby by default.

## Installation

1. Clone this repository to your local machine.
2. Navigate to the project directory.
3. Install the necessary dependencies using Bundler:
```bash
bundle install
```

## Run

To generate movie recommendations for a user, use the following Rake task:
```bash
rake recommend:movies[1,5]
```
It generates up to 5 movie recommendations for the User 1.

## Running the Tests

You can run the unit tests for this application using RSpec. To run the tests, navigate to the project directory and run the following command:
```bash
rspec
```

## Challenge Details

### Coding Challenge Guidelines
In the movies.json file you will find a list of 70 movies and the "movie preference" of about 800 users.  We would like you to create a application that takes as input a number of movie ID's and this data file. The application should then calculate and output a list of movie recommendations based on this list and the data file. Think about it as an Amazon.com suggestion: "the user says he likes movies A, B, C on this list, what other movies from the list would you recommend based on the other user data". 

Some points to pay attention to: 
- Think about testing, documentation, packaging, readability
- Make sure that the requirements to run the application can be easily run. 
- There is no "perfect" solution for this problem and there are many ways to try to solve it. Don't try to guess what we think is a good solution.

### CodeSubmit

Please organize, design, test and document your code as if it were
going into production - then push your changes to the master branch.

All the best,

The CodeSubmit Team
