Pod::Spec.new do |s|
  s.name         = "BJPlaybackCore"
  s.version      = "1.4.3"
  s.summary      = "BJPlaybackCore SDK."
  s.license      = "MIT"
  s.author       = { "辛亚鹏" => "xinyapeng@baijiahulian.com" }
  s.homepage     = "http://www.baijiacloud.com/"
  s.description = 'BJPlaybackCore SDK for iOS.'
  s.requires_arc = true

  s.platform     = :ios, "8.0"
  s.ios.deployment_target = "8.0"
  
  # git
  s.source = { :git => 'http://git.baijiashilian.com/open-ios/BJPlaybackCore.git', :tag => s.version.to_s }
  
  s.default_subspecs = ["static"]

  s.subspec "static" do |ss|
    ss.ios.preserve_paths       = 'BJPlaybackCore/BJPlaybackCore.framework'
    ss.ios.source_files         = 'BJPlaybackCore/BJPlaybackCore.framework/Versions/A/Headers/**/*.h'
    ss.ios.public_header_files  = 'BJPlaybackCore/BJPlaybackCore.framework/Versions/A/Headers/**/*.h'
    ss.ios.vendored_frameworks  = 'BJPlaybackCore/BJPlaybackCore.framework'
    ss.frameworks = ['CoreGraphics', 'Foundation', 'UIKit']
  
    ss.xcconfig = {
                 "ENABLE_BITCODE" => "NO", "CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" => "YES",
                 "GCC_PREPROCESSOR_DEFINITIONS" => "$(inherited) PODSPEC_NAME=#{s.name} PODSPEC_VERSION=#{s.version}"
                 }
  

    ss.dependency 'BJLiveCore', '~> 1.3.3'
    ss.dependency 'BJPlayerManagerCore', '~>1.4.4'
  end

#依赖 BJPlayerManagerCore/weak
  s.subspec "weak" do |ss|
    ss.ios.preserve_paths       = 'BJPlaybackCore/BJPlaybackCore.framework'
    ss.ios.source_files         = 'BJPlaybackCore/BJPlaybackCore.framework/Versions/A/Headers/**/*.h'
    ss.ios.public_header_files  = 'BJPlaybackCore/BJPlaybackCore.framework/Versions/A/Headers/**/*.h'
    ss.ios.vendored_frameworks  = 'BJPlaybackCore/BJPlaybackCore.framework'
    ss.frameworks = ['CoreGraphics', 'Foundation', 'UIKit']
  
    ss.xcconfig = {
                 "ENABLE_BITCODE" => "NO", "CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" => "YES",
                 "GCC_PREPROCESSOR_DEFINITIONS" => "$(inherited) PODSPEC_NAME=#{s.name} PODSPEC_VERSION=#{s.version}"
                 }
  

    ss.dependency 'BJLiveCore', '~> 1.3.3'
    ss.dependency 'BJPlayerManagerCore/weak', '~>1.4.4'

  end

  #依赖  BJLiveCore/weak
  s.subspec "livecore.weak" do |ss|
    ss.ios.preserve_paths       = 'BJPlaybackCore/BJPlaybackCore.framework'
    ss.ios.source_files         = 'BJPlaybackCore/BJPlaybackCore.framework/Versions/A/Headers/**/*.h'
    ss.ios.public_header_files  = 'BJPlaybackCore/BJPlaybackCore.framework/Versions/A/Headers/**/*.h'
    ss.ios.vendored_frameworks  = 'BJPlaybackCore/BJPlaybackCore.framework'
    ss.frameworks = ['CoreGraphics', 'Foundation', 'UIKit']
  
    ss.xcconfig = {
                 "ENABLE_BITCODE" => "NO", "CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" => "YES",
                 "GCC_PREPROCESSOR_DEFINITIONS" => "$(inherited) PODSPEC_NAME=#{s.name} PODSPEC_VERSION=#{s.version}"
                 }
  

    ss.dependency 'BJLiveCore/weak', '~> 1.3.3'
    ss.dependency 'BJPlayerManagerCore', '~>1.4.4'
  end

  #依赖 BJPlayerManagerCore/weak && BJLiveCore/weak
  s.subspec "all.weak" do |ss|
    ss.ios.preserve_paths       = 'BJPlaybackCore/BJPlaybackCore.framework'
    ss.ios.source_files         = 'BJPlaybackCore/BJPlaybackCore.framework/Versions/A/Headers/**/*.h'
    ss.ios.public_header_files  = 'BJPlaybackCore/BJPlaybackCore.framework/Versions/A/Headers/**/*.h'
    ss.ios.vendored_frameworks  = 'BJPlaybackCore/BJPlaybackCore.framework'
    ss.frameworks = ['CoreGraphics', 'Foundation', 'UIKit']
  
    ss.xcconfig = {
                 "ENABLE_BITCODE" => "NO", "CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" => "YES",
                 "GCC_PREPROCESSOR_DEFINITIONS" => "$(inherited) PODSPEC_NAME=#{s.name} PODSPEC_VERSION=#{s.version}"
                 }
  

    ss.dependency 'BJLiveCore/weak', '~> 1.3.3'
    ss.dependency 'BJPlayerManagerCore/weak', '~>1.4.4'
  end

  s.dependency 'BJLiveBase', '~> 1.3.4'
  s.dependency 'BJLiveBase/Ext'
  s.dependency 'BJLiveBase/Base'
  s.dependency 'BJLiveBase/YYModel'
  s.dependency 'BJLiveBase/Networking'
  
end
