require 'aws/s3'

AWS::S3::Base.establish_connection!({
  :server => 'localhost',
  :port => 4567,
  :access_key_id => '44CF9590006BF252F707',
  :secret_access_key => 'DEFAULT_SECRET'
})
