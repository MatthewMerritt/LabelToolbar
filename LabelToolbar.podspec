#
# Be sure to run `pod lib lint LabelToolbar.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LabelToolbar'
  s.version          = '0.1.0'
  s.summary          = 'LabelToolbar is a 3 Label/Button manager for your UIToolbar.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  LabelToolbar is a 3 UILabel/UIButton maanger for your UIToolbar that allows you to display information. It allows you can enable/disable the button that is attached to the toolbar with closure execution on .touchUpInside events.
                       DESC

  s.homepage         = 'https://github.com/MatthewMerritt/LabelToolbar'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'MatthewMerritt' => 'matthew.merritt@yahoo.com' }
  s.source           = { :git => 'https://github.com/MatthewMerritt/LabelToolbar.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'
  s.swift_versions = ['5.0', '5.1']

  s.source_files = 'LabelToolbar/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LabelToolbar' => ['LabelToolbar/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
