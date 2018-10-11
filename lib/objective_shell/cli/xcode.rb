require "objective_shell"

module ObjectiveShell
  class Xcode
    def self.dir_has_xc?
      Dir.glob("*.xc*").count > 0
    end

    def self.xc_files_in_pwd
      Dir.glob("*.xc*")
    end

    def self.open
      puts "No project or workspace file found in current directory"; return if !dir_has_xc?
      files = xc_files_in_pwd
      workspace = files.select { |f| f.include?("xcworkspace") }
      system("open #{workspace.first}") if !workspace.nil? || !workspace.empty?
      system("open #{files.first}") if files.count == 1
      return
    end
  end
end

# -Xfrontend -warn-long-function-bodies=100
#-Xfrontend -warn-long-expression-type-checking=100
# -Xfrontend -debug-time-compilation
# -debug-time-function-bodies

# xcodebuild -workspace Ham-Supplies.xcworkspace -scheme Ham-Supplies clean build OTHER_SWIFT_FLAGS="-Xfrontend -debug-time-function-bodies" | grep .[0-9]ms | grep -v ^0.[0-9]ms | sort -nr > culprits.txt
