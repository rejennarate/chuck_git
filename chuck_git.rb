#!/usr/bin/ruby

require 'rubygems'
require 'mechanize'

# let's assume today's date for now, but maybe later pass in a date as an argument
date = Time.now.strftime("%Y-%m-%d")

# need to get usernames from a csv
def get_file
end

def commits(username, date)
	agent = Mechanize.new
# get github.com/user
# url format: http://github.com/rejennarate?tab=contributions&from=2015-02-04
  page = agent.get("http://github.com/#{username}?tab=contributions&from=#{date}")
  # well this is super bold, let's hope the structure of this page never changes at all
  # daily activity is in array index 22
  puts page.links[22]
end

