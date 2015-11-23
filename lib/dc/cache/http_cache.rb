module DC
  module Cache
    module HTTPCache
      module Controller
        CACHE_DURATION = 5
        
        def cache(resource)
          # cache is sort of a misnomer in this sense
          # since caching will be dictated by behavior of the
          # downstream proxy.
          #
          # As such this is less an imperative command
          # and more the expression of a directive for how this
          # request should be treated by other parties.
          set_cache_headers
        end
        
        def expire(model)
          # expire should be called almost exclusively in contexts where
          # a user is logged in (and thus not subject to the public cache)
          # so `expire` is used to clear the PUBLIC cache of a resource
          # or set of resources.
        end
        
        def set_cache_headers
          response.headers['cache-control'] = ""
        end
        
      end
      
      module Model
        def resources
          [self.canonical_js_cache_path, self.canonical_json_cache_path].map do |path|
            File.join DC.server_root, path
          end
        end
      end
    end
  end
end