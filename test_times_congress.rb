API_KEY="GET_YOUR_OWN" #Available at http://developer.nytimes.com/
require 'times_congress'

puts NYTimes::Congress.new(API_KEY).members(111,"house").inspect
puts NYTimes::Congress.new(API_KEY).nomination_votes(111).inspect
puts NYTimes::Congress.new(API_KEY).roll_call_votes(110,"house", 2, 690).inspect
puts NYTimes::Congress.new(API_KEY).member_bio_and_roles("W000793").inspect
puts NYTimes::Congress.new(API_KEY).member_positions("W000793").inspect
