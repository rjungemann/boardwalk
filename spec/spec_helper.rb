require 'mongo'
require 'right_aws'
require 'right_http_connection'
require 'sinatra/base'
require 'fileutils'
require 'capybara'
require 'capybara/dsl'
require 'akephalos'
require "#{File.dirname(__FILE__)}/../lib/boardwalk"

Capybara.javascript_driver = :akephalos
Capybara.app = Boardwalk::App

ENV['RACK_ENV'] = 'test'
