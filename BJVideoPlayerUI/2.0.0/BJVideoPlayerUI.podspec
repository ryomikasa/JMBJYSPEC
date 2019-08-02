Pod::Spec.new do |s|
    s.name             = 'BJVideoPlayerUI'
    s.version          = '2.0.0'
    s.summary          = 'BJVideoPlayerUI SDK'
    s.description      = "BJVideoPlayerUI SDK for iOS."
    
    s.homepage         = 'http://www.baijiacloud.com/'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { '辛亚鹏' => 'xinyapeng@baijiahulian.com' }
    s.source           = { :git =>  'http://git.baijiashilian.com/open-ios/BJVideoPlayerUI.git', :tag => s.version.to_s }
    
    s.platform      = :ios, "9.0"
    s.ios.deployment_target = "9.0"
    
    s.requires_arc = true
    
    # use <"> but not <'> for #{s.name} and #{s.version}
    s.pod_target_xcconfig = {
        "CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" => "YES", # requies both `user_target_xcconfig` and `pod_target_xcconfig`
        "GCC_PREPROCESSOR_DEFINITIONS" => "$(inherited) BJVIDEOPLAYERUI_NAME=#{s.name} BJVIDEOPLAYERUI_VERSION=#{s.version}"
    }
    s.user_target_xcconfig = {
        "CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" => "YES" # requies both `user_target_xcconfig` and `pod_target_xcconfig`
    }
    
    s.default_subspecs = ['static']
    
    ## 默认集成framework
    s.subspec 'static' do |ss|
        ss.ios.preserve_paths       = 'frameworks/BJVideoPlayerUI.framework'
        ss.ios.source_files         = 'frameworks/BJVideoPlayerUI.framework/Versions/A/Headers/**/*.h'
        ss.ios.public_header_files  = 'frameworks/BJVideoPlayerUI.framework/Versions/A/Headers/**/*.h'
        ss.ios.resource             = 'frameworks/BJVideoPlayerUI.framework/Versions/A/Resources/BJVideoPlayerUI.bundle'
        ss.ios.vendored_frameworks  = 'frameworks/BJVideoPlayerUI.framework'
        ss.frameworks               = ['Foundation', 'UIKit', 'CoreTelephony', 'CoreMedia', 'AVFoundation', 'AVKit', 'MediaPlayer']
    end
    
    ## 源码集成
    s.subspec 'static.source' do |ss|
      ss.source_files = 'BJVideoPlayerUI/Classes/**/*'
      ss.resource_bundles = {
        'BJVideoPlayerUI' => ['BJVideoPlayerUI/Assets/*.png']
      }
    end
    
    s.dependency "BJLiveBase"
    s.dependency "BJLiveBase/Base"
    s.dependency "BJLiveBase/HUD"
    s.dependency "BJLiveBase/Networking"
    s.dependency "BJLiveBase/Networking+BaijiaYun"
    s.dependency 'BJVideoPlayerCore', '~> 2.0.0'
    
end
