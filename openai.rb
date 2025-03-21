require "http"
require "json"
require "dotenv/load"

# Prepare a hash that will become the headers of the request
request_headers_hash = {
  "Authorization" => "Bearer #{ENV.fetch("OPENAI_API_KEY")}",
  "content-type" => "application/json"
}

# Prepare a hash that will become the body of the request
request_body_hash = {
  "model" => "gpt-3.5-turbo",
  "messages" => [
    {
      "role" => "system",
      "content" => "You are a helpful assistant who talks like Shakespeare."
    },
    {
      "role" => "user",
      "content" => "Hello! What are the best spots for pizza in Chicago?"
    }
  ]
}

# Convert the Hash into a String containing JSON
request_body_json = JSON.generate(request_body_hash)

# Make the API call
raw_response = HTTP.headers(request_headers_hash).post(
  "https://api.openai.com/v1/chat/completions",
  :body => request_body_json
).to_s

# Parse the response JSON into a Ruby Hash
parsed_response = JSON.parse(raw_response)

pp parsed_response
