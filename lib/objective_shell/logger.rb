require "awesome_print"
require "objective_shell"
module ObjectiveShell
  class Logger

    def initialize
    end

    def debug(obj, options = {})
      options.merge!({"color" => :blueish})
      ap obj,options
    end
    
    def warn(obj, options = {})
      options.merge!({"color" => :cyan})
      ap obj,options
    end

    def error(obj, options = {})
      options.merge!({"color" => :red})
      ap obj, options
    end

    def info(obj, options = {})
      options.merge!({"color" => :pale})
      ap obj,options
    end
    
    def success(obj, options = {})
      options.merge!({"color" => :green})
      ap obj,options
    end
  end
end
