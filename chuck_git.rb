#!/usr/bin/ruby

require 'rubygems'
require 'mechanize'

# let's assume today's date for now, but maybe later pass in a date as an argument
date = Time.now.strftime("%Y-%m-%d")

def file_input
  if ARGV.empty?
    puts 'please provide a .csv file.'
  elsif ARGV.length > 1
    puts 'too many arguments provided. please provide a single file'
  else
    ARGV[0]
  end
end

# get usernames from a csv
def load_users 
	File.readlines(file_input).each do |line|
		usernames = line.split(",")
		# the return value of this method needs to be an array, not the file
		# so there's an explicit return
		return usernames
	end
end

def commits(date)
	puts "Today's date: #{date}"
	agent = Mechanize.new
  # get github url and substitute in a username and date
  load_users.each do |username|
    page = agent.get("http://github.com/#{username.chomp}?tab=contributions&from=#{date}")
	  # well this is super bold, let's hope the structure of this page never changes at all
	  # daily activity is in array index 22
	  green_bar = page.links[22].to_s
	  if green_bar.include?('Pushed')
	  	puts "#{username} #{green_bar.strip}"
	  else
	  	puts "#{username} did not push any commits. Perhaps they need...motivation."
	  end
	end
end

commits(date)