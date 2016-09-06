# coding: utf-8
# frozen_string_literal: true

#
# Este modulo e usado como base para todoas as telas.
# Ele contem metodos que podem ser utilizados nas duas plataformas
module Page
  def self.included(base)
    base.send :include, InstanceMethods
    base.extend ClassMethods
  end

  def self.get(key)
    pages = ObjectSpace.each_object(Class).select { |klass| klass < Page }

    pages.each do |page|
      return page if (page.respond_to? :key_value) && (page.key_value == key)
    end
  end

  #
  # Modulo com os metodos de classe
  module ClassMethods
    def descendants
      ObjectSpace.each_object(Class).select { |klass| klass < self }
    end

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

  #
  # Modulo com os metodos de instancia
  module InstanceMethods
    def initialize(world, transition_duration = 0.5)
      @elements = {}
      @elements = add_elements if respond_to? :add_elements
      super(world, transition_duration)
    end

    def get_element_query(key)
      @elements[key] if @elements.key? key
    end

    def touch_item(key_or_query)
      if @elements.key? key_or_query
        touch @elements[key_or_query]
      else
        touch key_or_query
      end
    end

    def text?(text, timeout = 5)
      wait_for(timeout: timeout) { element_exists "* marked:'#{text}'" }
    end
  end
end
