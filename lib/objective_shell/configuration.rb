require "objective_shell"

module ObjectiveShell
  class Configuration
    attr_accessor :gem_dev_directory, :gem_installed_directory, :scripts_directory

    def initialize()
      @gem_dev_directory = nil
      @gem_installed_directory = nil
      @scripts_directory = nil
      load if ObjectiveShell::Environment.env_files.count > 0
    end

    def load
      env_files = ObjectiveShell::Environment.env_files
      if !env_files.nil? || !env_files.empty?
        system("source #{env_files.first}")
        @gem_dev_directory = ENV["GEM_DEV_DIRECTORY"]
        @scripts_directory = ENV["GEM_DEV_SCRIPTS_DIRECTORY"]
      end
      return self
    end

    def gem_local_dev
      return @gem_dev_directory || ENV["GEM_DEV_DIRECTORY"]
    end

    def gem_local_dev_scripts
      return @scripts_directory || ENV["GEM_DEV_SCRIPTS_DIRECTORY"]
    end
  end
end
