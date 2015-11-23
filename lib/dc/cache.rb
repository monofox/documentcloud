module DC
  module Cache
    def self.strategy
      {
        :controller => PageCache::Controller, #HTTPCache::Controller,
        :model      => PageCache::Model       #HTTPCache::Model
      }
    end
  end
end

require_relative 'cache/model'
require_relative 'cache/page_cache'
require_relative 'cache/http_cache'