require 'pp'
require 'sinatra'
require 'rack/fiber_pool'

module Boardwalk
  class App < Sinatra::Base
    use Rack::FiberPool
    use Rack::Session::Cookie
  end
end

module Rack
  class Request
    def media_type
      content_type && content_type.split(/\s*[;,]\s*/, 2).first#.downcase
    end
  end
end

require 'boardwalk/mimetypes'
require 'boardwalk/helpers'
require 'boardwalk/errors'
require 'boardwalk/control_routes'
require 'boardwalk/s3_routes'
