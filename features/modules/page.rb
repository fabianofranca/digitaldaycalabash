
module Page
    @@pages =  Hash.new
    @@base_pages = Array.new

    def self.included(base)
        base.send :include, InstanceMethods
        base.extend ClassMethods

        @@base_pages.push base
    end

    def self.get(key)
        if @@pages.length == 0
            @@base_pages.each do |base|
                base.descendants.each do |descendant|        
                    @@pages[descendant.key] = descendant
                end
            end
        end

        @@pages[key]
    end

    module ClassMethods
        def descendants
            ObjectSpace.each_object(Class).select { |klass| klass < self }
        end

        def key
            self.name
        end        
    end

    module InstanceMethods

        def add_element_query(key, query)
            @elements = Hash.new if @elements.nil?  
            @elements[key] = query
        end

        def get_element_query(key)
            @elements[key] if @elements.has_key? key
        end

        def touch_item(key_or_query)        
            if @elements.has_key? key_or_query
                touch @elements[key_or_query]
            else
                touch key_or_query
            end
        end

        def has_text(text, timeout = 5)
            wait_for(timeout: timeout) { element_exists "* marked:'#{text}'" }
        end
    end
end