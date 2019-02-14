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

    parsed_page.css('div.content.block-group.chatterbox-margin a').map do |link|
      @detail_urls << link[:href]
    end
    @detail_urls
  end

  def detail_scraper
    detail_urls.uniq.map do |detail_url|
      unparsed_detail_page = HTTParty.get(detail_url)
      parsed_detail_page = Nokogiri::HTML(unparsed_detail_page)

      detail_page = {
        title: title(parsed_detail_page),
        artist: artist(parsed_detail_page),
        city: city(parsed_detail_page),
        venue: venue(parsed_detail_page),
        date: date(parsed_detail_page),
        price: price(parsed_detail_page)
      }
      @events << detail_page
    end
    @events
  end
end
