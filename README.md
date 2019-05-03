# Web Scraper Tech Test

Write software that scrapes concert information from the pages on this site and outputs the data in a machine readable format of your choice (e.g. JSON, XML, CSV etc.).

To get you started, here is the first page of the ‘browse all listings’ section of the site:

http://www.wegotickets.com/searchresults/all

Each event also has its own page, which is linked to from the event titles in the above. Your script should attempt to identify:

* the artists playing
* the city
* the name of the venue
* the date
* the price


## Stack

* Main code: Ruby
* Test Suites: RSpec
* Linting: Rubocop


## How it works

To get to the detail page means having to dive into each page on the list to grab data, rather than just gleaning everything off a list page, which would have been much easier, quicker and less expensive in terms of HTTP requests.

I noticed from using the inspect tool on Chrome that the href of the detail page is listed on the list page, so I set about accessing these first and saving them in an array. I then mapped over these urls to dive in and grab the information I needed for each event.


## Challenges

This was my first foray into web scraping, and the first time I've used Ruby in a few months, so I was relieved to find that it was actually not that hard to at least get going. The Ruby gems make life easier for the developer, that is for sure and I did have a look at the documentation of them before the challenge. I chose to keep the price as a string, as there's a bit of information there such as the booking fee. However, it should probably be a float as this would work with a payment system. 


## Extensions

With more time, I would have liked to work out a mock HTTP request for the tests - to reduce dependency on wegottickets. Also, this would hurry up the tests somewhat. There's also a lot of DRY refactoring to be done in the tests, and some on the class.

I would also use a database and store scraped data there. This would allow me to use my software on static and safe data - i.e. no more moving target. Caching data like this means you can get a lot of concert data saved for future synthesis. This does risk missing updates though - if the website data source changes and cannot be scraped immediately - and so this itself is not 100% bullet-proof. However, it does reduced the expensive HTTP requests for each query. If the database is itself updated every 30 minutes (perhaps more frequent than this), the database could be used as the central source of truth rather than making requests to 'We Got Tickets' constantly.

I feel that the way I have designed this program has meant it's not as fast as it could be. My main focus was on getting to all the information. Due to the time constraints and perhaps my weak web scraping skills, I decided that was the way to go.


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

![alt text](https://github.com/jdm79/web_scraper_ruby/blob/master/public/test-results.png)
