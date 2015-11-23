module DC
  module Cache
    module PageCache
      module Controller
        def cache(thing)
          cache_page thing
        end
        
        def expire(thing)
          expire_pages thing.resources if thing.responds_to? :resources
        end
        
        def expire_pages(paths)
          [paths].flatten.each { |path| expire_page path }
        end
      end
      
      module Model
      end
    end
  end
end