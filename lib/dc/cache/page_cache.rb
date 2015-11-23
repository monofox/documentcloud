module DC
  module Cache
    module PageCache
      module Controller
        def cache(data)
          cache_page data
        end
        
        def expire(model)
          expire_pages model.resources if model.responds_to? :resources
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