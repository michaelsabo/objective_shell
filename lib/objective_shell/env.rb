require 'objective_shell'

module ObjectiveShell
  # Your code goes here...


  module Environment
    extend self
    # @env = nil
    OSRC_HOME_LOCATION = ENV['HOME'] + "/osrc.env"
    
    def log
      @log ||= ObjectiveShell::Logger.new
    end

    alias_method :logger, :log

    def self.configuration
      @configuration ||= ObjectiveShell::Configuration.new
    end

    def reset
      @configuration = ObjectiveShell::Configuration.new
    end

    def configure
      yield(configuration)
    end

    def env_files
      Dir.glob(OSRC_HOME_LOCATION)
    end

    def first
      env_files.first
    end

    def load
      p Dir.pwd
      p Dir.glob(OSRC_HOME_LOCATION)
      raise "Setup your .env file before continuing" unless Dir.glob(OSRC_HOME_LOCATION).count > 0
      @env = Dotenv.load(OSRC_HOME_LOCATION)
    end
  end
end

ObjectiveShell::Environment.load