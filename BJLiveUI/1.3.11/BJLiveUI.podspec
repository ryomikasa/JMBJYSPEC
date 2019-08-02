Pod::Spec.new do |s|

    s.name          = 'BJLiveUI'
    s.version       = '1.3.11'
    s.summary       = 'BJLiveUI SDK.'
    s.description   = 'BJLiveUI SDK for iOS.'

    s.homepage      = 'http://www.baijiayun.com/'
    s.license       = 'MIT'
    s.author        = { 'MingLQ' => 'minglq.9@gmail.com' }

    s.platform      = :ios
    s.ios.deployment_target = '8.0'

    s.source        = {
        :git => 'http://git.baijiashilian.com/open-ios/BJLiveUI.git',
        :tag => s.version.to_s
    }
    s.pod_target_xcconfig = {
        "CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" => "YES",
        "ENABLE_BITCODE" => "NO", # TODO: BJHLMediaPlayer 支持 bitcode
        # use <"> but not <'> for #{s.name} and #{s.version}
        "GCC_PREPROCESSOR_DEFINITIONS" => "$(inherited) BJLIVEUI_NAME=#{s.name} BJLIVEUI_VERSION=#{s.version}"
    }

    s.default_subspecs = ['static']

    s.subspec 'static' do |ss|
        ss.ios.preserve_paths       = 'frameworks/BJLiveUI.framework'
        ss.ios.source_files         = 'frameworks/BJLiveUI.framework/Versions/A/Headers/**/*.h'
        ss.ios.public_header_files  = 'frameworks/BJLiveUI.framework/Versions/A/Headers/**/*.h'
        ss.ios.resource             = 'frameworks/BJLiveUI.framework/Versions/A/Resources/BJLiveUI.bundle'
        ss.ios.vendored_frameworks  = 'frameworks/BJLiveUI.framework'
        ss.dependency 'BJLiveUI/static.dependencies'
    end
    s.subspec 'static.source' do |ss|
        ss.public_header_files = [
            'classes/**/BJLiveUI.h',
            'classes/**/BJLRoomViewController.h',
            'classes/**/BJLOverlayViewController.h',
            'classes/**/BJLOverlayContainerController.h'
        ]
        ss.source_files  = ["classes", "classes/**/*.{h,m}"]
        ss.resource_bundles = {
            "BJLiveUI" => ["bundles/**/*.xcassets"]
        }
        ss.dependency 'BJLiveUI/static.dependencies'
    end
    s.subspec 'static.dependencies' do |ss|
        ss.frameworks = ['CoreGraphics', 'Foundation', 'MobileCoreServices', 'Photos', 'SafariServices', 'UIKit', 'WebKit']
        ss.dependency 'BJLiveBase', '~> 1.3.11'
        ss.dependency 'BJLiveBase/Base', '~> 1.3.11'
        ss.dependency 'BJLiveBase/Auth', '~> 1.3.11'
        ss.dependency 'BJLiveBase/Ext', '~> 1.3.11'
        ss.dependency 'BJLiveBase/HUD', '~> 1.3.11'
        ss.dependency 'BJLiveBase/Masonry', '~> 1.3.11'
        ss.dependency 'BJLiveBase/Networking', '~> 1.3.11'
        ss.dependency 'BJLiveBase/WebImage/AFNetworking', '~> 1.3.11'
        ss.dependency 'BJLiveCore', '~> 1.3.11'
        ss.dependency 'Masonry'
        ss.dependency 'QBImagePickerController', '~> 3.0'
    end
    
end
