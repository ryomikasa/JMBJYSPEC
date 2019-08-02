Pod::Spec.new do |s|
  s.name         = "BJPlaybackCore"
  s.version      = "1.4.9-alpha"
  s.summary      = "BJPlaybackCore SDK."
  s.license      = "MIT"
  s.author       = { "辛亚鹏" => "xinyapeng@baijiahulian.com" }
  s.homepage     = "http://www.baijiacloud.com/"
  s.description = 'BJPlaybackCore SDK for iOS.'
  s.requires_arc = true

  s.platform     = :ios, "8.0"
  s.ios.deployment_target = "8.0"
  
  s.frameworks = ['CoreGraphics', 'Foundation', 'UIKit']
  
  # git
  s.source = { :git => 'http://git.baijiashilian.com/open-ios/BJPlaybackCore.git', :tag => s.version.to_s }

  # # framework
  s.ios.preserve_paths       = 'BJPlaybackCore/BJPlaybackCore.framework'
  s.ios.source_files         = 'BJPlaybackCore/BJPlaybackCore.framework/Versions/A/Headers/**/*.h'
  s.ios.public_header_files  = 'BJPlaybackCore/BJPlaybackCore.framework/Versions/A/Headers/**/*.h'
#  s.ios.resource             = 'BJPlaybackCore/BJPlaybackCore.framework/Versions/A/Resources/**/*'
  s.ios.vendored_frameworks  = 'BJPlaybackCore/BJPlaybackCore.framework'
  
  s.xcconfig = {
                 "ENABLE_BITCODE" => "NO", "CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" => "YES",
                 "GCC_PREPROCESSOR_DEFINITIONS" => "$(inherited) PODSPEC_NAME=#{s.name} PODSPEC_VERSION=#{s.version}"
                }
  

  s.dependency 'BJLiveCore', '~> 1.3.8'
  s.dependency 'BJPlayerManagerCore', '~> 1.4.8'

  s.dependency 'BJLiveBase', '~> 1.3.8'
  s.dependency 'BJLiveBase/Ext'
  s.dependency 'BJLiveBase/Base'
  s.dependency 'BJLiveBase/YYModel'
  s.dependency 'BJLiveBase/Networking'
  s.dependency 'BJLiveBase/Networking+BaijiaYun'
 
end
