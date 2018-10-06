require "dotenv"
require "dotenv/load"
require "objective_shell/configuration"
require "objective_shell/version"
require "objective_shell/cli/xcode"
require "objective_shell/logger"
require "objective_shell/env"
require "fileutils"

ObjectiveShell::Environment.load

module ObjectiveShell
  # Your code goes here...

  def self.call(*args)
  end

  extend self

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
end
