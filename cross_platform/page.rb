# coding: utf-8
# frozen_string_literal: true

module CrossPlatform
  #
  # Este modulo e usado como base para todoas as telas.
  # Ele contem metodos de instancia que podem ser utilizados
  # nas duas plataformas
  module Page
    def self.included(klass)
      klass.extend ClassMethods
      klass.send :include, Core::Page
    end

    #
    # Modulo com os metodos de classe
    module ClassMethods
    end

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
