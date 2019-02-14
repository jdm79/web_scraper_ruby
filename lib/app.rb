require_relative 'scraper.rb'

scraper = ConcertScraper.new
detail_urls = scraper.url_scraper
events = scraper.detail_scraper
scraper.parse_data(events)
scraper.print_json
