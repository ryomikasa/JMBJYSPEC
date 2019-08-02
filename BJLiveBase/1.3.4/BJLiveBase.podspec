Pod::Spec.new do |s|

    s.name          = "BJLiveBase"
    s.version       = "1.3.4"
    s.summary       = "BJLiveBase SDK."
    s.description   = "BJLiveBase SDK for iOS."

    s.homepage      = "http://www.baijiayun.com/"
    s.license       = { :type => "MIT", :file => "LICENSE" }
    s.author        = { "MingLQ" => "minglq.9@gmail.com" }

    s.platform      = :ios, "8.0"
    s.ios.deployment_target = "8.0"

    # s.source        = { :git => "git@git.baijiashilian.com:ios/BJLiveBase.git", :tag => s.version.to_s }
    s.source        = { :git => "http://git.baijiashilian.com/open-ios/BJLiveBase.git", :tag => s.version.to_s }
    ## s.source        = { :git => "https://github.com/baijia/BJLiveBase.git", :tag => s.version.to_s }

    s.pod_target_xcconfig = {
        "GCC_PREPROCESSOR_DEFINITIONS" => "$(inherited) BJLIVEBASE_NAME=#{s.name} BJLIVEBASE_VERSION=#{s.version}"
    }

    s.prefix_header_contents = <<-DESC
#if (__IPHONE_OS_VERSION_MAX_ALLOWED >= 110000)
    #define bjl_available(VERSIONS, CONDITION) @available VERSIONS
#else
    #define bjl_available(VERSIONS, CONDITION) CONDITION
#endif

    DESC

    s.default_subspecs = ["Base"]

    s.subspec "Base" do |ss|
        ss.source_files = [
            "Foundation/**/*.{h,m}",
            "UIKit/**/*.{h,m}",
            "libextobjc/**/*.{h,m}"
        ]
        ss.public_header_files = [
            "Foundation/**/*.h",
            "UIKit/**/*.h",
            "libextobjc/**/*.h"
        ]
        ss.frameworks = ["Foundation", "UIKit", "WebKit"]
    end

    s.subspec "Auth" do |ss|
        ss.source_files  = ["Authorization/**/*.{h,m}"]
        ss.public_header_files = ["Authorization/**/*.h"]
        ss.frameworks = ["AVFoundation", "Foundation", "Photos", "UIKit"]
    end

    s.subspec "HUD" do |ss|
        ss.source_files = ["BJLProgressHUD/**/*.{h,m}"]
        ss.public_header_files = ["BJLProgressHUD/**/*.h"]
        ss.frameworks = ["Foundation", "UIKit"]
        ss.dependency "MBProgressHUD", "~> 1.0"
    end

    s.subspec "Masonry" do |ss|
        ss.source_files = ["Masonry+inset/**/*.{h,m}"]
        ss.public_header_files = ["Masonry+inset/**/*.h"]
        ss.frameworks = ["Foundation", "UIKit"]
        ss.dependency "Masonry", "~> 1.1"
    end

    s.subspec "Networking" do |ss|
        ss.source_files = ["BJLNetworking/**/*.{h,m}"]
        ss.public_header_files = ["BJLNetworking/**/*.h"]
        ss.frameworks = ["CoreGraphics", "Foundation", "MobileCoreServices", "Security", "SystemConfiguration", "UIKit"]
        # ss.dependency "AFNetworking", "~> 3.0"
    end

    s.subspec "Networking+BaijiaYun" do |ss|
        ss.source_files = ["BJLNetworking+BaijiaYun/**/*.{h,m}"]
        ss.public_header_files = ["BJLNetworking+BaijiaYun/**/*.h"]
        ss.dependency "BJLiveBase/Base"
        ss.dependency "BJLiveBase/Networking"
    end

    s.subspec "PocketSocket" do |ss|
        ss.subspec "Core" do |sss|
            sss.public_header_files = ["PocketSocket/BJLPSWebSocketDriver.h", "PocketSocket/BJLPSWebSocketTypes.h"]
            sss.source_files = ["PocketSocket/BJLPSWebSocketDriver.{h,m}", "PocketSocket/BJLPSWebSocketTypes.{h,m}", "PocketSocket/BJLPSWebSocketBuffer.{h,m}", "PocketSocket/BJLPSWebSocketDeflater.{h,m}", "PocketSocket/BJLPSWebSocketInflater.{h,m}", "PocketSocket/BJLPSWebSocketUTF8Decoder.{h,m}", "PocketSocket/BJLPSWebSocketInternal.h"]
            sss.frameworks = ["CFNetwork", "Foundation", "Security"]
            sss.libraries = ["z", "system"]
        end
        ss.subspec "Client" do |sss|
            sss.public_header_files = ["PocketSocket/BJLPSWebSocket.h"]
            sss.source_files = ["PocketSocket/BJLPSWebSocket.{h,m}", "PocketSocket/BJLPSWebSocketNetworkThread.{h,m}"]
            sss.dependency "BJLiveBase/PocketSocket/Core"
        end
        ss.subspec "Server" do |sss|
            sss.public_header_files = ["PocketSocket/BJLPSWebSocketServer.h"]
            sss.source_files = ["PocketSocket/BJLPSWebSocketServer.{h,m}"]
            sss.dependency "BJLiveBase/PocketSocket/Client"
        end
    end

    s.subspec "WebImage" do |ss|
        ss.subspec "BJLWebImage" do |sss|
            sss.source_files = ["BJLWebImage/**/*.{h,m}"]
            sss.public_header_files = ["BJLWebImage/**/*.h"]
            sss.frameworks = ["Foundation", "UIKit"]
        end
        ss.subspec "AFNetworking" do |sss|
            sss.source_files = ["AFWebImage/**/*.{h,m}"]
            sss.public_header_files = ["AFWebImage/**/*.h"]
            sss.dependency "BJLiveBase/Networking"
            sss.dependency "BJLiveBase/WebImage/BJLWebImage"
        end
        ss.subspec "SDWebImage" do |sss|
            sss.source_files = ["SDWebImage/**/*.{h,m}"]
            sss.public_header_files = ["SDWebImage/**/*.h"]
            sss.dependency "BJLiveBase/WebImage/BJLWebImage"
            sss.dependency "SDWebImage"
            sss.dependency "SDWebImage/WebP"
        end
        ss.subspec "YYWebImage" do |sss|
            sss.source_files = ["YYWebImage/**/*.{h,m}"]
            sss.public_header_files = ["YYWebImage/**/*.h"]
            sss.dependency "BJLiveBase/WebImage/BJLWebImage"
            sss.dependency "YYWebImage"
            sss.dependency "YYImage/WebP"
        end
    end

    s.subspec "YYModel" do |ss|
        ss.source_files  = ["YYModel/**/*.{h,m}"]
        ss.public_header_files = ["YYModel/**/*.h"]
        ss.frameworks = ["Foundation", "CoreFoundation"]
    end

    # DEPRECATED
    s.subspec "Ext" do |ss|
        ss.dependency "BJLiveBase/Base"
    end

    # DEPRECATED: All but NO SDWebImage and YYWebImage
    s.subspec "All-DEPRECATED" do |ss|
        # ss.source_files = ["umbrella/BJLiveBase.{h,m}"]
        # ss.public_header_files = ["umbrella/BJLiveBase.h"]
        ss.dependency "BJLiveBase/Base"
        ss.dependency "BJLiveBase/Auth"
        ss.dependency "BJLiveBase/HUD"
        ss.dependency "BJLiveBase/Masonry"
        ss.dependency "BJLiveBase/Networking"
        ss.dependency "BJLiveBase/Networking+BaijiaYun"
        ss.dependency "BJLiveBase/PocketSocket"
        ss.dependency "BJLiveBase/WebImage/AFNetworking"
        ss.dependency "BJLiveBase/YYModel"
    end

end
