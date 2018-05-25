require 'google-search'
require 'json'


image = Google::Search::News(query: "picture").first

print image
