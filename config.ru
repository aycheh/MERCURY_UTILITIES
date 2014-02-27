require "rubygems"
require "bundler/setup"
require "sinatra"
require "haml"
require "./app"
require "kona_aes"
require "shotgun"
require "rspec"
require "cucumber"
 
set :run, false
set :raise_errors, true
 
run Sinatra::Application
