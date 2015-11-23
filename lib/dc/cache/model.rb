module DC
  module Cache
    module Model
      def cacheable?
        self.publicly_accessible?
      end
      
      def resources
        [self.canonical_js_cache_path, self.canonical_json_cache_path]
      end
      
      def cache_attributes(attributes={})
        cache_attributes = {
          etag:          self,
          last_modified: self.updated_at,
          public:        self.cacheable?,
          template:      false
        }.merge(attributes)
      end
    end
  end
end