#
# Be sure to run `pod lib lint BJPlaybackUI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BJPlaybackUI'
  s.version          = '2.0.0-alpha'
  s.summary          = 'A short description of BJPlaybackUI.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/oushizishu/BJPlaybackUI'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'oushizishu' => 'xinyapeng@baijiahulian.com' }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.requires_arc = true

  s.source           = { :git => 'http://git.baijiashilian.com/open-ios/BJPlaybackUI.git', :tag => s.version.to_s }

  s.frameworks = ['CoreGraphics', 'Foundation', 'MobileCoreServices', 'Photos', 'UIKit']
  s.user_target_xcconfig = {
    "CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" => "YES" # requies both `user_target_xcconfig` and `pod_target_xcconfig`
  }
  s.pod_target_xcconfig = {
    "CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" => "YES", # requies both `user_target_xcconfig` and `pod_target_xcconfig`
    "GCC_PREPROCESSOR_DEFINITIONS" => "$(inherited) BJPLAYBACKUI_NAME=#{s.name} BJPLAYBACKUI_VERSION=#{s.version}"
  }

  s.default_subspecs = ['static']

  ## 默认集成framework
  s.subspec 'static' do |ss|
      ## framework
      ss.ios.preserve_paths       = 'frameworks/BJPlaybackUI.framework'
      ss.ios.source_files         = 'frameworks/BJPlaybackUI.framework/Versions/A/Headers/**/*.h'
      ss.ios.public_header_files  = 'frameworks/BJPlaybackUI.framework/Versions/A/Headers/**/*.h'
      ss.ios.resource             = 'frameworks/BJPlaybackUI.framework/Versions/A/Resources/BJPlaybackUI.bundle'
      ss.ios.vendored_frameworks  = 'frameworks/BJPlaybackUI.framework'
  end

  ## 集成源码
  s.subspec 'static.source' do |ss|
      ss.source_files = 'BJPlaybackUI/Classes/**/*'
      ss.resource_bundles = {
        'BJPlaybackUI' => ['BJPlaybackUI/**/*.xcassets']
      }
  end
    

  s.frameworks = ['Foundation', 'UIKit', 'CoreTelephony', 'CoreMedia', 'AVFoundation', 'AVKit', 'MediaPlayer']
  s.dependency "BJLiveBase"
  s.dependency "BJLiveBase/Base"
  s.dependency "BJLiveBase/HUD"
  s.dependency "BJLiveBase/Auth"
  s.dependency "BJLiveBase/Networking"
  s.dependency "BJLiveBase/Networking+BaijiaYun"
  s.dependency "BJLiveBase/WebImage/BJLWebImage"
  s.dependency 'BJVideoPlayerCore', '~> 2.0.0-alpha'

end
