class RoomScraper
    def initialize(index_url)
        @index_url = index_url
        @doc = Nokogiri::HTML(open(index_url))
        #binding.pry
    end

    def call
        rows.each do |row_doc|
        Room.create_from_hash(scrape_row(row_doc))#=> Should put room in my database
        end
    end

    private

        def rows
            @rows ||= @doc.search("ul.rows li.result-row")
        end

        def scrape_row(row)
            
           {
            :date_created => row.search("time").attribute("datetime"),
            :title => row.search("h2 a").text.gsub('\n',''),
            :url => row.search("h2 a").attribute("href").text,
            :price => row.search("span.result-price").text,
            }   
        end
end