#
# Be sure to run `pod lib lint BJHL-VideoPlayer-Manager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BJPlayerManagerCore'
  s.version          = '1.3.0-alpha'
  s.summary          = 'BJPlayerManagerCore SDK'
  s.description      = 'BJPlayerManagerCore for iOS'
  s.requires_arc     = true
  s.homepage         = 'http://git.baijiashilian.com/open-ios/BJVideoPlayerCore.git'
  s.license          = "MIT" 
  s.author           = { '杨健' => 'yangjian@baijiahulian.com' }

  s.ios.deployment_target = '8.0'
  s.frameworks = ['CoreGraphics', 'Foundation', 'UIKit', 'MediaPlayer', 'CoreTelephony']
  
  s.source           = { :git => 'http://git.baijiashilian.com/open-ios/BJVideoPlayerCore.git', :tag => s.version.to_s }
  s.xcconfig = { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'}
  
  # # framework
  s.ios.preserve_paths       = 'BJPlayerManagerCore/BJPlayerManagerCore.framework'
  s.ios.source_files         = 'BJPlayerManagerCore/BJPlayerManagerCore.framework/Versions/A/Headers/**/*.h'
  s.ios.public_header_files  = 'BJPlayerManagerCore/BJPlayerManagerCore.framework/Versions/A/Headers/**/*.h'
#  s.ios.resource             = 'BJPlayerManagerCore/BJPlayerManagerCore.framework/Versions/A/Resources/**/*'
  s.ios.vendored_frameworks  = 'BJPlayerManagerCore/BJPlayerManagerCore.framework'

  
  # # library
#  s.public_header_files = 'BJPlayerManagerCore/**/*.h'
#  s.source_files        = 'BJPlayerManagerCore/**/*.h'
#  s.vendored_libraries  = 'BJPlayerManagerCore/**/*.a'
  
  
  s.dependency 'BJLLogStat', '~> 0.9.0-alpha'
  s.dependency 'BJVideoPlayer'
  s.dependency 'BJLiveBase', '~> 1.3.0-alpha'
  s.dependency 'BJLiveBase/Base'
  s.dependency 'BJLiveBase/YYModel'
  s.dependency 'BJLiveBase/Networking'
  
  s.dependency 'ASIHTTPRequest'

end
