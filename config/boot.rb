# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

begin
  require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
rescue => exception
  puts exception.backtrace
  raise exception
end
