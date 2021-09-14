Pod::Spec.new do |s|
  s.name             = 'RepeatableRandom'
  s.version          = '0.1.0'
  s.summary          = 'Repeatable Random order for XCTests'
  s.description      = <<-DESC
  Execute Xcode Tests in a random order to detect interdependency of tests.
  Order can be repeated to reproduce and debug.
                       DESC

  s.homepage         = 'https://github.com/paulz/RepeatableRandom'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Paul Zabelin' => 'paulz@users.noreply.github.com' }
  s.source           = { :git => 'https://github.com/paulz/RepeatableRandom.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/iospaulz'

  s.osx.deployment_target = '10.11'
  s.ios.deployment_target = '12.0'

  s.source_files = 'RepeatableRandom/Classes/**/*'
  s.frameworks = 'XCTest'
  s.swift_versions = '5.0'
  s.pod_target_xcconfig = {
      # Fix Xcode warning by using deployment target set in Podfile
      # XCTest was built for newer macOS version (10.15) than being linked (10.11)
      'MACOSX_DEPLOYMENT_TARGET' => '$(inherited)',
      'IPHONEOS_DEPLOYMENT_TARGET' => '$(inherited)',
  }
end
