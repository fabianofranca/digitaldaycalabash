
module Page
    @@pages =  Hash.new
    @@base_pages = Array.new
    @@page_keys =  Hash.new

    def self.included(base)
        base.send :include, InstanceMethods
        base.extend ClassMethods

        @@base_pages.push base
    end

    def self.get(key)
        if @@pages.length == 0
            @@base_pages.each do |base|
                base.descendants.each do |descendant|
                    k = descendant.name
                    k = @@page_keys[descendant.name] if @@page_keys.has_key? descendant.name
                    @@pages[k] = descendant
                end
            end
        end

        @@pages[key]
    end

    def self.add_key(name, key)
        @@page_keys[name] = key
    end

    module ClassMethods
        def descendants
            ObjectSpace.each_object(Class).select { |klass| klass < self }
        end

        def trait(query)
            define_method(:trait) { query }
        end

        def key(value)            
            Page.add_key(self.name, value)            
        end

        def elements(&block)
            define_method(:add_elements, *block)
        end
    end

    module InstanceMethods

        def initialize(world, transition_duration=0.5)
            if respond_to? :add_elements                
                @elements = add_elements                  
            else
                @elements = Hash.new
            end
            
            super(world, transition_duration)
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