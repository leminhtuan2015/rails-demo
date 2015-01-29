require 'rubygems'
require 'redis'
require 'json'

$redis = Redis.new(:host => 'localhost', :port => 6379)
puts "=========================REDIS CONNECTE========================"

