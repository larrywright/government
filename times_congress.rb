require 'rubygems'
require 'httparty'

module NYTimes
  class Congress
    include HTTParty
    base_uri 'http://api.nytimes.com/svc/politics/v2/us/legislative/congress'

    def initialize(key)
      @format = "json" #xml is also valid
      self.class.default_params "api-key" => key
    end

    def roll_call_votes(congress, chamber, session, rollcall)
      self.class.get("/#{congress}/#{chamber}/sessions/#{session}/votes/#{rollcall}.#{@format}")
    end

    def nomination_votes(congress)
      self.class.get("/#{congress}/nominations.#{@format}")
    end

    def members(congress, chamber, state=nil, district=nil)
      #district requires a state, and is only valid if chamber is the house
      #TODO currently, state & district are currently ignored
      self.class.get("/#{congress}/#{chamber}/members.#{@format}")
    end

    def member_positions(member_id)
      self.class.get("/members/#{member_id}/votes.#{@format}")
    end

    def member_bio_and_roles(member_id)
      self.class.get("/members/#{member_id}.#{@format}")
    end

  end
end
