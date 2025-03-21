require 'net/http'
require 'json'

api_key = ENV["NYT_API_KEY"]

url = "https://api.nytimes.com/svc/news/v3/content/nyt/business.json?api-key=#{api_key}&type=Article"


uri = URI(url)
response = Net::HTTP.get(uri)

data = JSON.parse(response)

# Prints out all the article titles from recent (like today, and a bit yesterday)
# for article in data['results']
#   if article['title'] != "Read the document"
#     puts article['title']
#     puts article['published_date'][0,10]
#     puts " \n"
#   end
# end

for key in data['results'][1].keys
  puts key
  puts ""
  puts data['results'][1][key]
  puts ""
  puts "NEW ONE \n"
end
