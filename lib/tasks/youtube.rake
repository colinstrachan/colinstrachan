require 'csv'
require 'nokogiri'
require 'open-uri'
require 'net/http'
require 'openssl'
require 'json'
require 'uri'

namespace :netflex do
  desc "TODO"
  task seed: :environment do

    APIKEY = ENV['YTAPIKEY']
    CHANNELID = "UC2YBT7HYqCbbvzu3kKZ3wnw"
    
    url = URI("https://www.googleapis.com/youtube/v3/search?order=date&part=snippet&channelId=#{CHANNELID}&maxResults=25&key=#{APIKEY}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)

    response = http.request(request)

    hashed = JSON.parse(response.read_body)

    hashed['items'].each do |item|
      next if item['id']['videoId'].nil?
      puts item['snippet']['publishedAt'].to_date.to_s + " | " + item['snippet']['title'] + " | " + item['id']['videoId']
      if item['snippet']['publishedAt'].to_date.to_s == DateTime.now.to_date.strftime("%Y-%m-%d").to_s
        create_draft(item['snippet']['title'], item['id']['videoId'])
      end
    end

    def create_draft(posttitle, postcontent)
      auth = "Basic " + ENV['WPAPPPASS']
    
      url = URI("https://netflexkids.com/wp-json/wp/v2/posts")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Post.new(url, {'Authorization' => auth})

      request["Content-Type"] = 'application/json'
      request.body = {"title": posttitle, "status": "draft", "format": "video", "content": postcontent}.to_json  
    end

  end
end