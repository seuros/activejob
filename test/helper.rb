require 'bundler'
Bundler.setup

$LOAD_PATH << File.dirname(__FILE__) + "/../lib"

require 'active_job'

ENV['AJADAPTER'] ||= 'inline'
require "adapters/#{ENV['AJADAPTER']}"

puts "Testing using #{ENV['AJADAPTER']}"
require 'active_support/testing/autorun'


ActiveJob::Base.logger.level = Logger::ERROR
