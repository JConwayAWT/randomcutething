require 'net/http'
require 'json'

class Cute < ActiveRecord::Base

  def self.update_cutes
    cutes = 0
    uri = URI("http://www.reddit.com/r/aww/new.json?limit=100")
    response = Net::HTTP.get_response(uri)
    if response.is_a?(Net::HTTPSuccess)
      j = JSON.parse(response.body)
      children = j["data"]["children"]
      children.each do |child|
        url = child["data"]["url"]
        if url.downcase.ends_with?(".jpg",".jpeg",".gif",".png",".bmp")
          c = Cute.new
          c.url = url

          if cutes == 0
            Cute.delete_all
          end
          
          c.save!
          cutes += 1
        end
      end
    end
    puts "Total number of cutes: " + cutes.to_s
  end

end
