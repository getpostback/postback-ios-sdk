Pod::Spec.new do |s|
  s.name             = 'AppSprintSDK'
  s.version          = '1.0.1'
  s.summary          = 'AppSprint mobile attribution SDK for iOS'
  s.description      = 'Lightweight attribution SDK for iOS apps. Tracks installs, events, and attribution with offline support.'
  s.homepage         = 'https://appsprint.app'
  s.license          = { :type => 'MIT' }
  s.author           = { 'AppSprint' => 'support@appsprint.app' }
  s.source           = {
    :http => "https://github.com/getappsprint/appsprint-ios-sdk/releases/download/v#{s.version}/AppSprintSDK.xcframework.zip"
  }

  s.ios.deployment_target = '14.0'
  s.vendored_frameworks = 'AppSprintSDK.xcframework'
  s.swift_version = '5.9'

  s.frameworks = 'Foundation', 'UIKit'
  s.weak_frameworks = 'AdServices', 'AppTrackingTransparency', 'AdSupport'
end
