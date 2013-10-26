namespace :test do
  desc "Run the NSMoment Tests for iOS"
  task :ios => :prepare do
    $ios_success = system("xctool -workspace NSMomentTests.xcworkspace -scheme 'iOSTests' -sdk iphonesimulator -configuration Release test -test-sdk iphonesimulator")
  end
end

desc "Run the NSMoment Tests for iOS"
task :test => ['test:ios'] do
  puts "\033[0;31m! iOS unit tests failed" unless $ios_success
  if $ios_success
    puts "\033[0;32m** All tests executed successfully"
  else
    exit(-1)
  end
end

task :default => 'test'
