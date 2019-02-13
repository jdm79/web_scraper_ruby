# Web Scraper Tech Test

The WeGotTickets UK homepage is at http://www.wegotickets.co.uk/. Write software that scrapes concert information from the pages on this site and outputs the data in a machine readable format of your choice (e.g. JSON, XML, CSV etc.).

To get you started, here is the first page of the ‘browse all listings’ section of the site:

http://www.wegotickets.com/searchresults/all

Each event also has its own page, which is linked to from the event titles in the above. Your script should attempt to identify:

* the artists playing
* the city
* the name of the venue
* the date
* the price

You may choose to include additional information which you think might be of interest. We are aware that it is next to impossible to get perfect data for these fields!

We are only interested in musical events, but don’t worry if your script outputs data for other kinds of events (comedy etc.) If they appear in your script’s output you can assume that they will be safely ignored.


## Stack

Main code: Ruby
Test Suites: RSpec
Linting: Rubocop


## How it works


## Tests


## Challenges


## Extensions


## How to install and use

To install:
```
$ git clone git@github.com:jdm79/web_scraper_ruby.git
$ cd web_scraper_ruby
```

Then install the gems which are in the library:
```
$ bundle install
```

To run the program:
```
$ ruby lib/app.rb
```


## How to test
In root of app directory:
```
$ rspec
```
To check the linting:
```
$ rubocop
```