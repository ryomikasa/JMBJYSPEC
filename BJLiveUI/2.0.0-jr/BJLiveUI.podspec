Pod::Spec.new do |s|
    
    s.name          = "BJLiveUI"
    s.version       = "2.0.0-jr"
    s.summary       = "BJLiveUI SDK."
    s.description   = "BJLiveUI SDK for iOS."
    
    s.homepage      = "http://www.baijiayun.com/"
    s.license       = "MIT"
    s.author        = { "MingLQ" => "minglq.9@gmail.com" }
    
    s.platform      = :ios, "9.0"
    s.ios.deployment_target = "9.0"
    
    s.source        = {
        :git => "http://git.baijiashilian.com/open-ios/BJLiveUI.git",
        :tag => s.version.to_s
    }
    
    s.requires_arc = true
    
    # use <"> but not <'> for #{s.name} and #{s.version}
    s.pod_target_xcconfig = {
        "CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" => "YES", # requies both `user_target_xcconfig` and `pod_target_xcconfig`
        "GCC_PREPROCESSOR_DEFINITIONS" => "$(inherited) BJLIVEUI_NAME=#{s.name} BJLIVEUI_VERSION=#{s.version}"
    }
    s.user_target_xcconfig = {
        "CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" => "YES" # requies both `user_target_xcconfig` and `pod_target_xcconfig`
    }
    
    s.default_subspecs = ['static']
    
    s.subspec 'static' do |ss|
        ss.preserve_paths       = 'frameworks/BJLiveUI.framework'
        ss.source_files         = 'frameworks/BJLiveUI.framework/Versions/A/Headers/**/*.h'
        ss.public_header_files  = 'frameworks/BJLiveUI.framework/Versions/A/Headers/**/*.h'
        ss.resources            = ['frameworks/BJLiveUI.framework/Versions/A/Resources/BJLiveUI.bundle', 'frameworks/BJLiveUI.framework/Versions/A/Resources/BJLInteractiveClass.bundle']
        ss.vendored_frameworks  = 'frameworks/BJLiveUI.framework'
        ss.dependency 'BJLiveUI/static.dependencies'
    end
    
    s.subspec 'static.dependencies' do |ss|
        ss.frameworks = ['CoreGraphics', 'Foundation', 'MobileCoreServices', 'Photos', 'SafariServices', 'UIKit', 'WebKit', 'SpriteKit']
        ss.dependency "BJLiveBase", '~> 2.0.0'
        ss.dependency "BJLiveBase/Base"
        ss.dependency "BJLiveBase/Auth"
        ss.dependency "BJLiveBase/HUD"
        ss.dependency "BJLiveBase/Networking"
        ss.dependency "BJLiveBase/WebImage/AFNetworking"
        
        ss.dependency "BJLiveCore", "2.0.0-jx"
        ss.dependency "QBImagePickerController", "~> 3.0"
    end
    
end
