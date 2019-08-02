#
# Be sure to run `pod lib lint BJHL-VideoPlayer-Manager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name          = 'BJVideoPlayerCore'
    s.version       = '2.0.0-rc02'
    s.summary       = 'BJVideoPlayerCore'
    s.description   = "BJVideoPlayerCore SDK for iOS."
    
    s.homepage      = 'http://www.baijiacloud.com/'
    s.license       = { :type => 'MIT', :file => 'LICENSE' }
    s.author        = { '辛亚鹏' => 'xinyapeng@baijiahulian.com' }
    s.source           = { :git => 'http://git.baijiashilian.com/open-ios/BJVideoPlayerCore.git', :tag => s.version.to_s }
    
    s.platform      = :ios, "9.0"
    s.ios.deployment_target = "9.0"
    
    s.requires_arc = true
    
    s.pod_target_xcconfig = {
        "CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" => "YES" # requies both `user_target_xcconfig` and `pod_target_xcconfig`
    }
    s.user_target_xcconfig = {
        "CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" => "YES" # requies both `user_target_xcconfig` and `pod_target_xcconfig`
    }
    
    s.default_subspecs = 'static'
    
    s.subspec 'static' do |ss|
        ss.preserve_paths       = 'BJVideoPlayerCore/BJVideoPlayerCore.framework'
        ss.source_files         = 'BJVideoPlayerCore/BJVideoPlayerCore.framework/Versions/A/Headers/**/*.h'
        ss.public_header_files  = 'BJVideoPlayerCore/BJVideoPlayerCore.framework/Versions/A/Headers/**/*.h'
        ss.vendored_frameworks  = 'BJVideoPlayerCore/BJVideoPlayerCore.framework'
        ss.frameworks           = ['Foundation', 'UIKit', 'CoreTelephony', 'CoreMedia', 'AVFoundation', 'AVKit']
        ss.dependency "BJVideoPlayerCore/BJYIJKMediaFramework"
    end
    
    s.subspec 'BJYIJKMediaFramework' do |ss|
                ss.xcconfig = {"ENABLE_BITCODE" => "NO"}
        ss.frameworks = ["AVFoundation", "GLKit", "VideoToolbox"]
        ss.libraries = ["c++", "z", "bz2"]
        ss.source_files = [
            "frameworks/BJYIJKMediaFramework.framework/**/IJKFFMoviePlayerController.h",
            "frameworks/BJYIJKMediaFramework.framework/**/IJKMediaPlayback.h",
            "frameworks/BJYIJKMediaFramework.framework/**/IJKFFOptions.h",
            "frameworks/BJYIJKMediaFramework.framework/**/IJKFFMonitor.h",
        ]
        ss.private_header_files = [
            "frameworks/BJYIJKMediaFramework.framework/**/IJKFFMoviePlayerController.h",
            "frameworks/BJYIJKMediaFramework.framework/**/IJKMediaPlayback.h",
            "frameworks/BJYIJKMediaFramework.framework/**/IJKFFOptions.h",
            "frameworks/BJYIJKMediaFramework.framework/**/IJKFFMonitor.h",
        ]
        ss.preserve_paths = ["frameworks/BJYIJKMediaFramework.framework", "frameworks/EmbedFrameworks.sh"]
    end
    
    s.dependency 'BJLiveBase'
    s.dependency "BJLiveBase/Download"
    s.dependency 'BJLiveBase/Base'
    s.dependency 'BJLiveBase/YYModel'
    s.dependency 'BJLiveBase/Networking'
    s.dependency "BJLiveBase/Networking+BaijiaYun"
    s.dependency "BJLiveBase/WebImage/BJLWebImage"
    s.dependency 'BJLiveCore', '~> 2.0.0-rc02'
    
end
