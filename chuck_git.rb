#!/usr/bin/ruby

require 'rubygems'
require 'mechanize'

agent = Mechanize.new

# get github.com/login
# this will require user input of username/password - need to figure out how to handle that
page = agent.get('http://github.com/login')
# then find the un/pw form and assign it to a variable
# since there are two forms with name 'nil' we need to find the second form by index
# http://stackoverflow.com/questions/28017130/ruby-mechanize-find-form-w-no-name
form = page.forms[1]
form.login = 'user_input'
form.password = 'encrypted_somehow_user_input'
page = agent.submit(form)