require 'sinatra'
require 'rack/fiber_pool'

class Boardwalk < Sinatra::Base
  use Rack::FiberPool

  load 'lib/boardwalk/mimetypes.rb'
  load 'lib/boardwalk/helpers.rb'
  load 'lib/boardwalk/errors.rb'
  load 'lib/boardwalk/s3_routes.rb'
end
