#
# Be sure to run `pod lib lint BJPlaybackUI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BJPlaybackUI'
  s.version          = '1.4.9'
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

  s.ios.deployment_target = '8.0'
  s.requires_arc = true

  s.source           = { :git => 'http://git.baijiashilian.com/open-ios/BJPlaybackUI.git', :tag => s.version.to_s }

  s.frameworks = ['CoreGraphics', 'Foundation', 'MobileCoreServices', 'Photos', 'UIKit']
  
  ## 集成源码
#   s.source_files = 'BJPlaybackUI/Classes/**/*'
#   s.resources = ["BJPlaybackUI/images/**/*.xcassets", "strings/**/*.lproj"]

  s.default_subspecs = ['static']

  s.subspec 'static' do |ss|
      ss.xcconfig = {"ENABLE_BITCODE" => "NO", "CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" => "YES"}
      ## framework
      ss.ios.preserve_paths       = 'frameworks/BJPlaybackUI.framework'
      ss.ios.source_files         = 'frameworks/BJPlaybackUI.framework/Versions/A/Headers/**/*.h'
      ss.ios.public_header_files  = 'frameworks/BJPlaybackUI.framework/Versions/A/Headers/**/*.h'
      ss.ios.resource             = 'frameworks/BJPlaybackUI.framework/Versions/A/Resources/BJPlaybackUI.bundle'
      ss.ios.vendored_frameworks  = 'frameworks/BJPlaybackUI.framework'
      ss.dependency 'BJPlaybackCore', '~> 1.4.9'
  end

  s.subspec 'weak' do |ss|
      ss.xcconfig = {"ENABLE_BITCODE" => "NO", "CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" => "YES"}
      ## framework
      ss.ios.preserve_paths       = 'frameworks/BJPlaybackUI.framework'
      ss.ios.source_files         = 'frameworks/BJPlaybackUI.framework/Versions/A/Headers/**/*.h'
      ss.ios.public_header_files  = 'frameworks/BJPlaybackUI.framework/Versions/A/Headers/**/*.h'
      ss.ios.resource             = 'frameworks/BJPlaybackUI.framework/Versions/A/Resources/BJPlaybackUI.bundle'
      ss.ios.vendored_frameworks  = 'frameworks/BJPlaybackUI.framework'
      ss.dependency 'BJPlaybackCore/weak', '~> 1.4.9'
  end
    
  s.dependency 'BJLiveBase', '~> 1.3.8'
  s.dependency 'BJLiveBase/Masonry'
  s.dependency 'Masonry'
  s.dependency 'MBProgressHUD'

end
