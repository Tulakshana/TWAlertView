#
# Be sure to run `pod lib lint TAlertView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TWAlertView'
  s.version          = '0.1.4'
  s.summary          = 'A simple pod which could be used to show an alert in your iOS app'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'This pod is inspired by UIAlertController. TWAlertView will automatically recognise the top most view controller to display the alert, making showing a simple alert a hazzel free task.'

  s.homepage         = 'https://github.com/Tulakshana/TWAlertView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'tulakshana' => 'tula_post@yahoo.com' }
  s.source           = { :git => 'https://github.com/Tulakshana/TWAlertView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '7.0'

  s.source_files = 'TWAlertView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'TWAlertView' => ['TWAlertView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
