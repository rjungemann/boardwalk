require "#{File.dirname(__FILE__)}/spec_helper"

describe 'the control service' do

end

describe 'the s3 service' do
  before do
    @s3_settings = {
      :key => '44CF9590006BF252F707',
      :secret => 'OtxrzxIsfpFjA7SwPzILwy8Bw21TLhquhboDYROV',
      :bucket_name => 'thefifthsample_uploads',
      :settings => {
        :server => '127.0.0.1',
        :port => 4567,
        :protocol => 'http'
      }
    }
    @service = RightAws::S3.new @s3_settings[:key], @s3_settings[:secret], @s3_settings[:settings]
  end

  it 'lets a user retrieve a list of buckets' do
    @service.buckets.class.should == Array
  end

  it 'lets a user add and delete a new bucket' do
    bucket = @service.bucket('thefifthsample_new', true, 'public-read')

    @service.buckets.find_all { |b| b.to_s == 'thefifthsample_new' }.length.should > 0

    bucket.delete

    @service.buckets.find_all { |b| b.to_s == 'thefifthsample_new' }.length.should == 0
  end

  it 'lets a user add an item, retrieve it, and delete it' do
    bucket = @service.bucket('thefifthsample_new', true, 'public-read')

    bucket.put('README.markdown', open('README.markdown'))

    bucket.keys.find_all { |k| k.to_s == 'README.markdown' }.length.should > 0

    key = RightAws::S3::Key.new(bucket, 'README.markdown')

    key.exists?.should == true

    key.delete

    key.exists?.should == false

    bucket.delete
  end
end
