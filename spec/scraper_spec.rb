require 'scraper'

RSpec.describe ConcertScraper do
  it 'should have a url scraper method' do
    scraper_object = ConcertScraper.new
    expect(scraper_object.url_scraper).to be_truthy
  end

  it 'should have a detail scraper method' do
    scraper_object = ConcertScraper.new
    expect(scraper_object.detail_scraper).to be_truthy
  end

  it 'should have an events method that returns an events array' do
    scraper_object = ConcertScraper.new
    expect(scraper_object.events).to be_instance_of Array
  end

  context "when using the scraper methods" do
    it "should return an array" do
      scraper_object = ConcertScraper.new
      expect(scraper_object.url_scraper).to be_instance_of Array
    end
    
    it "should return an array" do
      scraper_object = ConcertScraper.new
      expect(scraper_object.detail_scraper).to be_instance_of Array
    end
  end
end
