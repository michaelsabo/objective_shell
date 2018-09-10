require "macos_dev_please/version"
require "macos_dev_please/cli"

require 'fileutils'

module MacosDevPlease
  # Your code goes here...

  def self.open_xcode
    dir = Dir.pwd
    files = Dir.glob("*.xc*")
    puts "No project or workspace file found" if files.empty?
    
    workspace = files.select { |f| f.include?("xcworkspace")}
    system("open #{workspace.first}") if !workspace.nil? || !workspace.empty?
    system("open #{files.first}") if files.count == 1
    return
  end
end
