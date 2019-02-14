require 'nokogiri'
require 'json'
require 'httparty'

class ConcertScraper
  attr_reader :detail_urls, :events

  def initialize
    @detail_urls = []
    @events = []
  end

  def url_scraper
    url = 'http://www.wegottickets.com/searchresults/all'
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)

    parsed_page.css('div.content.block-group.chatterbox-margin a').map { |link| 
      @detail_urls << link[:href]
    }
    @detail_urls
  end

  def detail_scraper
    true
  end
end
