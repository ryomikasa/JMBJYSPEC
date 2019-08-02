Pod::Spec.new do |s|
    
    s.name          = "BJLiveCore"
    s.version       = "2.0.0-alpha03"
    s.summary       = "BJLiveCore SDK."
    s.description   = "BJLiveCore SDK for iOS."
    
    s.homepage      = "http://www.baijiayun.com/"
    s.license       = "MIT"
    s.author        = { "MingLQ" => "minglq.9@gmail.com" }
    
    s.platform      = :ios, "9.0"
    s.ios.deployment_target = "9.0"
    
    s.source = {
        :git => 'http://git.baijiashilian.com/open-ios/BJLiveCore.git',
        :tag => s.version.to_s
    }
    
    s.requires_arc = true
    
    s.pod_target_xcconfig = {
        "CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" => "YES" # requies both `user_target_xcconfig` and `pod_target_xcconfig`
    }
    s.user_target_xcconfig = {
        "CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" => "YES" # requies both `user_target_xcconfig` and `pod_target_xcconfig`
    }
    
    s.default_subspecs = ['static']
    
    s.subspec 'static' do |ss|
        ss.preserve_paths       = 'frameworks/BJLiveCore.framework'
        ss.source_files         = 'frameworks/BJLiveCore.framework/Versions/A/Headers/**/*.h'
        ss.public_header_files  = 'frameworks/BJLiveCore.framework/Versions/A/Headers/**/*.h'
        ss.vendored_frameworks  = 'frameworks/BJLiveCore.framework'
        ss.libraries            = ["resolv"]
        ss.frameworks           = ['CoreGraphics', 'CoreTelephony', 'Foundation', 'UIKit', 'WebKit']
        ss.dependency 'BJLiveCore/BJHLMediaPlayer'
        ss.dependency 'BJLiveCore/BJYRTCEngine'
    end
    
    s.subspec 'BJHLMediaPlayer' do |ss|
        ss.user_target_xcconfig = {
            "ENABLE_BITCODE" => "NO", # requies `user_target_xcconfig`, TODO: "YES"
        }
        ss.preserve_paths       = ["frameworks/BJHLMediaPlayer.framework", "frameworks/EmbedFrameworks.sh"]
        ss.source_files         = ["frameworks/BJHLMediaPlayer.framework/**/gsx_rtc_types.h"]
        ss.private_header_files = ["frameworks/BJHLMediaPlayer.framework/**/gsx_rtc_types.h"]
        ss.frameworks           = ['AVFoundation', 'GLKit', 'VideoToolbox']
        ss.libraries            = ['icucore', 'c++', 'z']
    end
    
    s.subspec 'BJYRTCEngine' do |ss|
        ss.vendored_frameworks  = ['frameworks/BJYRTCEngine.framework', 'frameworks/BJRTCSDK.framework', 'frameworks/WebRTC.framework']
        ss.source_files         = ["frameworks/BJYRTCEngine.framework/Versions/A/Headers/*.h", "frameworks/BJRTCSDK.framework/Versions/A/Headers/*.h", "frameworks/WebRTC.framework/**/*.h"]
        ss.private_header_files = ["frameworks/BJYRTCEngine.framework/Versions/A/Headers/*.h", "frameworks/BJRTCSDK.framework/Versions/A/Headers/*.h", "frameworks/WebRTC.framework/**/*.h"]
        ss.frameworks           = ['CFNetwork', 'AVFoundation', 'Security', 'CoreMotion', 'GLKit', 'VideoToolbox']
        ss.libraries            = ['icucore', 'c++', 'z']
        ss.dependency 'AgoraRtcEngine_iOS'
    end
    
    s.dependency "BJLiveBase", "~> 2.0.0-alpha02"
    s.dependency "BJLiveBase/Base"
    s.dependency "BJLiveBase/Networking"
    s.dependency "BJLiveBase/Networking+BaijiaYun"
    s.dependency "BJLiveBase/PocketSocket/Client"
    s.dependency "BJLiveBase/WebImage/BJLWebImage"
    s.dependency "BJLiveBase/WebImage/AFNetworking"
    s.dependency "BJLiveBase/YYModel"

end
