require 'csv'
require 'nokogiri'
require 'open-uri'
require 'net/http'
require 'openssl'
require 'json'
require 'uri'

namespace :wordpress do
  desc "TODO"
  task post: :environment do

    auth = "Basic " + ENV['WPAPPPASS']
    
    url = URI("https://netflexkids.com/wp-json/wp/v2/posts")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url, {'Authorization' => auth})

    request["Content-Type"] = 'application/json'
    request.body = {"title": "test api post", "status": "draft", "format": "video", "content": "api test"}.to_json
    puts request.body
  end
end