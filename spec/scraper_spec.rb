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

  context 'when using the scraper methods' do
    it 'should return an array' do
      scraper_object = ConcertScraper.new
      expect(scraper_object.url_scraper).to be_instance_of Array
    end

    it 'should return an array' do
      scraper_object = ConcertScraper.new
      expect(scraper_object.detail_scraper).to be_instance_of Array
    end
  end

  context 'when accessing event data in ConcertScraper class' do
    it 'the events array should contain hashes' do
      scraper_object = ConcertScraper.new
      scraper_object.url_scraper
      scraper_object.detail_scraper
      expect(scraper_object.events.sample).to be_instance_of Hash
    end

    it 'the event hash should have 6 keys' do
      scraper_object = ConcertScraper.new
      scraper_object.url_scraper
      scraper_object.detail_scraper
      random_event_hash = scraper_object.events.sample
      expect(random_event_hash.keys.count).to eq 6
    end
  end

  context 'when looking at the keys and values in event hash' do
    def create_service_object
      scraper_object = ConcertScraper.new
      scraper_object.url_scraper
      scraper_object.detail_scraper
    end

    it 'should have a title' do
      scraper_object = ConcertScraper.new
      scraper_object.url_scraper
      scraper_object.detail_scraper
      random_event_hash = scraper_object.events.sample
      expect(random_event_hash.key?(:title)).to be true
    end

    it 'should have an artist' do
      scraper_object = ConcertScraper.new
      scraper_object.url_scraper
      scraper_object.detail_scraper
      random_event_hash = scraper_object.events.sample
      expect(random_event_hash.key?(:artist)).to be true
    end

    it 'should have a city' do
      scraper_object = ConcertScraper.new
      scraper_object.url_scraper
      scraper_object.detail_scraper
      random_event_hash = scraper_object.events.sample
      expect(random_event_hash.key?(:city)).to be true
    end

    it 'should have a venue' do
      scraper_object = ConcertScraper.new
      scraper_object.url_scraper
      scraper_object.detail_scraper
      random_event_hash = scraper_object.events.sample
      expect(random_event_hash.key?(:venue)).to be true
    end

    it 'should have a date' do
      scraper_object = ConcertScraper.new
      scraper_object.url_scraper
      scraper_object.detail_scraper
      random_event_hash = scraper_object.events.sample
      expect(random_event_hash.key?(:date)).to be true
    end

    it 'should have a price' do
      scraper_object = ConcertScraper.new
      scraper_object.url_scraper
      scraper_object.detail_scraper
      random_event_hash = scraper_object.events.sample
      expect(random_event_hash.key?(:price)).to be true
    end
  end
end
