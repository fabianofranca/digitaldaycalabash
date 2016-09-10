# coding: utf-8
# frozen_string_literal: true

#
# Este modulo reune as funcionalidades base do projeto
module Core
  #
  # Esta classe da acesso a funcionalidade do Calabash indenpendente
  # da plataforma
  class Platform
    @current = nil

    class << self
        attr_reader :current
    end

    def self.create_current
      if defined? Calabash::Android
        send :include, Calabash::Android::Operations
      elsif defined? Calabash::Cucumber
        send :include, Calabash::Cucumber::Operations
      end

      @current = Platform.new
    end

    create_current
  end
end
