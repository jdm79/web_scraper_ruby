require 'nokogiri'
require 'json'
require 'httparty'

class ConcertScraper
  attr_reader :events

  def initialize
    @events = []
  end

  def url_scraper
    url = 'http://www.wegottickets.com/searchresults/all'
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
  end

  def detail_scraper
    true
  end
end
