require "bundler/gem_tasks"
require "rspec/core/rake_task"
require 'dotenv/tasks'

task mytask: :dotenv do
    # things that require .env
end

RSpec::Core::RakeTask.new(:spec)

task :xc do
  
end


task :default => :spec

task :build do
end

task :install do
end

task :uninstall do 
  p `gem uninstall objective_shell -x`
end

task :rcfile do 
  osrc_file = Dir.glob("osrc.env").first
  raise "No file found" if osrc_file.nil? || osrc_file.empty?
  FileUtils.cp(osrc_file, ENV['HOME'])
end
