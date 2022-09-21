# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'uri'
require 'net/http'
require 'openssl'
require 'json'
# require 'nokogiri'

url = URI("https://api-nba-v1.p.rapidapi.com/games?date=2022-10-19")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["X-RapidAPI-Key"] = '60bab11f1fmsh79b55fc7168e222p1396a5jsnfa025c4a5171'
request["X-RapidAPI-Host"] = 'api-nba-v1.p.rapidapi.com'

response = http.request(request)

#puts response.read_body
h = JSON.parse(response.read_body)



visitors1 = h['response'].first['teams']['visitors']
home1 = h['response'].first['teams']['home']

#   puts home1['name']
#    puts home1


  h['response'].each do |match|
 

    Home.create(name: match['teams']['home']['name'], nickname: match['teams']['home']['nickname'], logo: match['teams']['home']['logo'], code: match['teams']['home']['code'])
   
    Visitor.create(name: match['teams']['visitors']['name'], nickname: match['teams']['visitors']['nickname'], logo: match['teams']['visitors']['logo'], code: match['teams']['visitors']['code'])

  end