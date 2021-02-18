#
# Be sure to run `pod lib lint LGLExtension.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LGLExtension'
  s.version          = '0.1.0'
  s.summary          = 'LGLExtension is  a library written in swift '

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  'LGLExtension is  a library written in swift'
                       DESC

  s.homepage         = 'https://github.com/lgliang/LGLExtension'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'liguoliangiOS' => '185226139@qq.com' }
  s.source           = { :git => 'https://github.com/lgliang/LGLExtension.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.swift_version =  '5.0'

  s.source_files = 'LGLExtension/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LGLExtension' => ['LGLExtension/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
