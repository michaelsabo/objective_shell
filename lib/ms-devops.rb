require 'dotenv'
require 'dotenv/load'
require "ms-devops/version"
require "ms-devops/cli"
require "ms-devops/configuration"
require "ms-devops/logger"

require "fileutils"

module MsDevops
  # Your code goes here...

  
  @env = Dotenv.load('.env')
  
  def self.open_xcode
    
    dir = Dir.pwd
    files = Dir.glob("*.xc*")
    puts "No project or workspace file found" if files.empty?

    workspace = files.select { |f| f.include?("xcworkspace") }
    system("open #{workspace.first}") if !workspace.nil? || !workspace.empty?
    system("open #{files.first}") if files.count == 1
    return
  end

  def self.call(*args)
  end

  def self.env_files
    Dir.glob("*.env")
  end

  class << self
    attr_accessor :configuration
    attr_accessor :log
  end

  def self.log
    @log ||= MsDevops::Logger.new
  end

  def self.configuration
    @configuration ||= MsDevops::Configuration.new
  end

  def self.reset
    @configuration = MsDevops::Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
