# coding: utf-8
# frozen_string_literal: true

#
# Este modulo reune as funcionalidades base do projeto
module Core
  #
  # Este modulo e usado como base para todoas as Pages.
  # Ele contem metodos de classe que podem ser utilizados
  # nas duas plataformas
  module Page
    def self.included(klass)
      klass.extend ClassMethods
    end

    def self.get(key)
      pages = ObjectSpace.each_object(Class).select do |klass|
        klass < Core::Page
      end

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

    # Coloque diretamente no module os metodos de instancia'
  end

  #
  # Tenta executar um block durante um tempo determinado. Caso o block seja
  # executado um lambda e disparado, senao nada e feito
  # rubocop:disable Lint/UselessAssignment, Lint/HandleExceptions
  def self.try(timeout = DEFAULT_TIMEOUT, test)
    Core::Platform.current.wait_for(timeout: timeout) { test.call }
    yield if block_given?
  rescue Core::Platform::WaitError => ex
  end
  # rubocop:enable Lint/UselessAssignment, Lint/HandleExceptions
end
