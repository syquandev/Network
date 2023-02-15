#
# Be sure to run `pod lib lint Network.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Network'
  s.version          = '1.0.0'
  s.summary          = 'A short description of Network.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/95286760/Network'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '95286760' => 'lasyquan@gmail.com' }
  s.source           = { :git => 'https://github.com/95286760/Network.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.swift_version = '4.2'
  s.ios.deployment_target = '11.0'

  s.source_files = 'Network/Classes/**/*'
  
  s.resource_bundles = {
    'Network' => [
    'Network/Assets/Storyboards/**/*.storyboard',
    'Network/Assets/Xibs/**/*.xib',
    'Network/Assets/Resources/**/*.xcassets',
    'Network/Classes/**/*.xib',
    'Network/Classes/**/*.storyboard']
  }
  
  s.dependency 'RxSwift', '~> 5'
  s.dependency 'ObjectMapper', '4.2.0'
  s.dependency 'Alamofire', '~> 5.4'
  s.dependency 'TUSKit', '~> 1.4.2'
  s.dependency 'SVProgressHUD'
end
