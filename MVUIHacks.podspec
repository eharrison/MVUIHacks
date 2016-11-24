#
# Be sure to run `pod lib lint AwesomeData.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = 'MVUIHacks'
s.version          = '0.2.3'
s.summary          = 'A collection of UI Hacks.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = <<-DESC
A collection of UI Designables.
DESC

s.homepage         = 'https://github.com/iOSWizards/MVUIHacks'
# s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Evandro Hoffmann' => 'evandro@itsdayoff.com' }
s.source           = { :git => 'https://github.com/iOSWizards/MVUIHacks.git', :tag => s.version.to_s }
# s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

s.ios.deployment_target = '8.0'

s.source_files = 'MVUIHacks/Classes/**/*.{swift}'

# s.resource_bundles = {
#   'AwesomeData' => ['MVUIHacks/Assets/*.png']
# }

# s.public_header_files = 'Pod/Classes/**/*.h'
s.frameworks = 'UIKit'

end
