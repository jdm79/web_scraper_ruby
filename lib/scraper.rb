require 'nokogiri'
require 'json'
require 'httparty'

class ConcertScraper
  attr_reader :detail_urls, :events, :main_element, :price_element, :results

  def initialize
    @detail_urls = []
    @events = []
    @main_element = 'div.left.full-width-mobile.event-information.event-width'
    @price_element = 'td.half.text-top.text-right'
    @results = []
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

  def parse_data(events)
    @results = JSON.pretty_generate @events
  end

  def print_json
    puts results
  end

  private

  def loading
    puts "Loading..."
  end

  def title(detail)
    detail.css(main_element).text.split("\n")[1].strip
  end

  def artist(detail)
    detail.css(main_element).text.split("\n")[2].strip
  end

  def city(detail)
    detail.css(main_element).text.split("\n")[4].split(" ")[0].tr(':', '').downcase.capitalize
  end

  def venue(detail)
    detail.css(main_element).text.split("\n")[4].split(" ")[1..-1].join(" ")
  end

  def date(detail)
    detail.css(main_element).text.split("\n")[5].strip
  end

  def price(detail)
    detail.css(price_element).text.split("\n")[1].strip
  end
end
