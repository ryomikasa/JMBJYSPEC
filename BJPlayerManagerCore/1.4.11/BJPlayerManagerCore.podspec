#
# Be sure to run `pod lib lint BJHL-VideoPlayer-Manager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BJPlayerManagerCore'
  s.version          = '1.4.11'
  s.summary          = 'BJPlayerManagerCore SDK'
  s.description      = 'BJPlayerManagerCore for iOS'
  s.requires_arc     = true
  s.homepage         = 'https://github.com/baijia/BJPlayerManagerCore.git'
  s.license          = "MIT" 
  s.author           = { '杨健' => 'yangjian@baijiahulian.com' }

  s.platform      = :ios, "8.0"
  s.ios.deployment_target = '8.0'
  s.frameworks = ['CoreGraphics', 'Foundation', 'UIKit', 'MediaPlayer', 'CoreTelephony']
  
  s.source           = { :git => 'http://git.baijiashilian.com/open-ios/BJVideoPlayerCore.git', :tag => s.version.to_s }

  s.default_subspecs = ["static"]

  s.subspec "static" do |ss|
    ss.xcconfig = { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'}
  
    # # framework
    ss.ios.preserve_paths       = 'BJPlayerManagerCore/BJPlayerManagerCore.framework'
    ss.ios.source_files         = 'BJPlayerManagerCore/BJPlayerManagerCore.framework/Versions/A/Headers/**/*.h'
    ss.ios.public_header_files  = 'BJPlayerManagerCore/BJPlayerManagerCore.framework/Versions/A/Headers/**/*.h'
    ss.ios.vendored_frameworks  = 'BJPlayerManagerCore/BJPlayerManagerCore.framework'
    ss.dependency 'BJVideoPlayer', '~> 1.4.14'
  
  end

   s.subspec "weak" do |ss|
    ss.xcconfig = { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'}
  
    # # framework
    ss.ios.preserve_paths       = 'BJPlayerManagerCore/BJPlayerManagerCore.framework'
    ss.ios.source_files         = 'BJPlayerManagerCore/BJPlayerManagerCore.framework/Versions/A/Headers/**/*.h'
    ss.ios.public_header_files  = 'BJPlayerManagerCore/BJPlayerManagerCore.framework/Versions/A/Headers/**/*.h'
    ss.ios.vendored_frameworks  = 'BJPlayerManagerCore/BJPlayerManagerCore.framework'
    ss.dependency 'BJVideoPlayer', '1.4.14-weak'
  
  end

    s.dependency 'BJLLogStat', '~> 0.9.1'
    s.dependency 'BJLiveBase', '~> 1.3.9'
    s.dependency 'BJLiveBase/Base'
    s.dependency 'BJLiveBase/YYModel'
    s.dependency 'BJLiveBase/Networking'
    s.dependency 'BJLiveBase/Networking+BaijiaYun'

    s.dependency 'ASIHTTPRequest'


end
