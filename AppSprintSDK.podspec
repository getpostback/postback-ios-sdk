Pod::Spec.new do |s|
  s.name             = 'AppSprintSDK'
  s.version          = '1.1.9'
  s.summary          = 'AppSprint mobile attribution SDK for iOS'
  s.description      = 'Lightweight attribution SDK for iOS apps. Tracks installs, events, and attribution with offline support.'
  s.homepage         = 'https://appsprint.app'
  s.license          = {
    :type => 'MIT',
    :text => <<-LICENSE
MIT License

Copyright (c) 2026 AppSprint

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
    LICENSE
  }
  s.author           = { 'AppSprint' => 'support@appsprint.app' }
  s.source           = {
    :http => "https://github.com/getappsprint/appsprint-ios-sdk/releases/download/v#{s.version}/AppSprintSDK.xcframework.zip"
  }

  s.ios.deployment_target = '14.0'
  s.vendored_frameworks = 'AppSprintSDK.xcframework'
  s.swift_version = '5.9'

  s.frameworks = 'Foundation', 'UIKit', 'CoreTelephony', 'Metal', 'CoreGraphics', 'CryptoKit'
  s.weak_frameworks = 'AdServices', 'AppTrackingTransparency', 'AdSupport'
end
