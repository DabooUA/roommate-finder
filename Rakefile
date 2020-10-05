require_relative './config/environment'

def reload!
    load_all './lib'
end

task :console do
    Pry.start
end

task :scrape_rooms do
    # instantiate a craper, and then have it find new rooms
    detroit_scraper = RoomScraper.new('https://detroit.craigslist.org/search/roo')
    detroit_scraper.call
    denver_scraper = RoomScraper.new('https://denver.craigslist.org/search/roo')
    denver_scraper.call
    # after this method call, I should be able to say Room.all 
    # and have rooms there
end