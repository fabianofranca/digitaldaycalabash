# coding: utf-8
# frozen_string_literal: true

module Core
#
# Este modulo e usado como base para todoas as Pages.
# Ele contem metodos de classe que podem ser utilizados nas duas plataformas
  module Page
    def self.included(klass)
      klass.extend ClassMethods
    end 

    def self.get(key)      
      pages = ObjectSpace.each_object(Class).select { |klass| klass < Core::Page }

      pages.each do |page|
        return page if (page.respond_to? :key_value) && (page.key_value == key)
      end
    end

    #
    # Modulo com os metodos de classe inseridos na Page
    module ClassMethods
      def trait(query)
        define_method(:trait) { query }
      end

      def key(value)
        instance_eval %(
            def key_value
              "#{value}"
            end
          )
      end

      def elements(elements)
        define_method(:add_elements) { elements }
      end
    end

    #Coloque diretamente no module os metodos de instancia'
  end
end
