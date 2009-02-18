require 'rubygems'
require 'httparty'
class GOP
  API_TOKEN="GET_YOUR_OWN"
  include HTTParty
  base_uri 'www.gop.gov'

  def self.members()
    post('/api/member.getall', :query => {:api_token => API_TOKEN})
  end

  def self.member_by_zip(zip)
    options = {:query => {:zip => zip,:api_token => API_TOKEN}}
    post('/api/member.zip',options)
  end

  def self.committees()
    post('/api/committee.getall', :query => {:api_token => API_TOKEN})
  end

  def self.votes(congress)
    options = {:query => {:vote_congress => congress,:api_token => API_TOKEN}}
    post('/api/vote.getall', options)
  end

end
