require "awesome_print"

module MsDevops
  class Logger
    attr_accessor :log

    def initialize
    end

    def log(obj, options = {})
      options.merge!({"color" => :cyan})
      ap obj,options
    end

    def error(obj, options = {})
      options.merge!({"color" => :red})
      ap obj,options
    end

    def info(obj, options = {})
      options.merge!({"color" => :yellow})
      ap obj,options
    end
  end
end
