#
# Be sure to run `pod lib lint JustPieChart.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JustPieChart'
  s.version          = '0.1.0'
  s.summary          = 'The easiest pie chart for iOS'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Simple and elegant pie chart for iOS applications
                       DESC

  s.homepage         = 'https://github.com/astrokin/PieChart'
  s.screenshots      = 'https://dl.dropboxusercontent.com/s/pbfn4v9e4562qf8/demo.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Alexey Strokin' => 'alex.strok@gmail.com' }
  s.source           = { :git => 'https://github.com/astrokin/PieChart.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'JustPieChart/JustPieChart/Classes/**/*'
  
  # s.resource_bundles = {
  #   'JustPieChart' => ['JustPieChart/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
