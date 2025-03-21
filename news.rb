require 'net/http'
require 'json'

api_key = ENV["NEWS_KEY"]
#sources=wsj
url = "https://newsapi.org/v2/everything?&q=business&apiKey=#{api_key}"

uri = URI(url)
response = Net::HTTP.get(uri)

data = JSON.parse(response)

all = []

# finding articles from specific news outlet

# data['articles'].each do |article|
#   # article['source'] is likely a hash; we pull out the 'name'
#   all << article['source']['name']
# end

# puts all.uniq

puts data['articles']
