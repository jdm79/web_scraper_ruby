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

When I first got going on this challenge I realised that the main list page has all the information required except the price. To get the price of the tickets requires clicking on the detail page. Luckily all the data needed was on the detail page, so I decided that it was worth the extra step in order to get this. For me as a punter I'd like to see how much something costs - it's one of the most important criteria in purchasing a ticket.

To get to the detail page means having to dive into each page on the list to grab data, rather than just gleaning everything off a list page, which would have been much easier, quicker and less expensive in terms of HTTP requests.

I noticed from using the inspect tool on Chrome that the href of the detail page is listed on the list page, so I set about accessing these first and saving them in an array. I then mapped over these urls to dive in and grab the information I needed for each event.


## Challenges

This was my first foray into web scraping, and the first time I've used Ruby in a few months, so I was relieved to find that it was actually not that hard to at least get going. The Ruby gems make life easier for the developer, that is for sure and I did have a look at the documentation of them before the challenge. 

The big challenge I saw was that you are working on a moving target. The HTML elements are prone to change as well as perhaps the naming conventions of the tags (I saw hyphens, camel-casing and underscores on 'We Got Tickets'). This means that our software will fail whenever this happens. We cannot guess correctly what changes will be made unless we are being warned in advance.

As a result, our software needs to be extremely robust under failure. As the software will fail repeatedly, it is best to be prepared for this and to absolutely expect it.

As well as focusing on achieving the goal set, I was thinking of flexibility and readability of code. It's necessary to consider who might next be maintaining the code you are writing. In the time-frame I did the best I could. With further time I'd like to have worked on pagination to create a method which works through the pages, but time did not allow. 


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