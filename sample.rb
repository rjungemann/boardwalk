require 'pp'
require 'right_aws'

service = RightAws::S3.new(
  '44CF9590006BF252F707',
  'OtxrzxIsfpFjA7SwPzILwy8Bw21TLhquhboDYROV',
  {
    :server => '127.0.0.1',
    :port => 4567,
    :protocol => 'http'
  }
)

bucket = service.bucket('thefifthsample', true, 'public_read')

pp service.buckets
