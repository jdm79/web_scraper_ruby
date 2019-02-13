require 'scraper'

RSpec.describe ConcertScraper do
  it "should have a url scraper method" do
    scraper_object = ConcertScraper.new
    expect(scraper_object.url_scraper).to be_truthy
  end
end
