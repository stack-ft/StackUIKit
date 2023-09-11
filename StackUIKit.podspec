#
# Be sure to run `pod lib lint StackUIKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'StackUIKit'
  s.version          = '1.0.0'
  s.summary          = 'A robust UIKit for rapidly building Fintech applications'
  s.swift_version = '5.0'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = 'Introducing our advanced UIKit designed specifically for the Fintech sector. Our toolkit offers a comprehensive suite of tools and components tailored to meet the unique demands of financial technology applications. Whether you are looking to create a digital banking platform, a cryptocurrency wallet, or any other Fintech solution, our UIKit provides a robust foundation to accelerate your development process. With a focus on reliability, scalability, and user experience, our UIKit ensures that developers can rapidly build and deploy Fintech applications without compromising on performance or security. Dive into a world of seamless development with our meticulously crafted tools and witness a transformative approach to Fintech application design and implementation.'

  s.homepage         = 'https://github.com/stack-ft/StackUIKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'Apache', :file => 'LICENSE' }
  s.author           = { 'Stack Financial' => 'developers@stack-ft.com' }
  s.source           = { :git => 'https://github.com/stack-ft/StackUIKit.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/stackft'

  s.ios.deployment_target = '14.0'

  s.source_files = 'StackUIKit/Classes/**/*.{swift,storyboard,xib}'
  s.resources = 'StackUIKit/**/*.{otf,xcassets,strings,gif,svg}'
  
  # s.resource_bundles = {
  #   'StackUIKit' => ['StackUIKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
