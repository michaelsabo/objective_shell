
module MsDevops
  class Xcode
  end
end

# -Xfrontend -warn-long-function-bodies=100
#-Xfrontend -warn-long-expression-type-checking=100
# -Xfrontend -debug-time-compilation
# -debug-time-function-bodies

# xcodebuild -workspace Ham-Supplies.xcworkspace -scheme Ham-Supplies clean build OTHER_SWIFT_FLAGS="-Xfrontend -debug-time-function-bodies" | grep .[0-9]ms | grep -v ^0.[0-9]ms | sort -nr > culprits.txt