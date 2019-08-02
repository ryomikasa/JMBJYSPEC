Pod::Spec.new do |s|

    s.name          = "BJLiveBase"
    s.version       = "1.2.0"
    s.summary       = "BJLiveBase SDK."
    s.description   = "BJLiveBase SDK for iOS."

    s.homepage      = "http://www.baijiayun.com/"
    s.license       = { :type => "MIT", :file => "LICENSE" }
    s.author        = { "MingLQ" => "minglq.9@gmail.com" }

    s.platform      = :ios
    s.ios.deployment_target = "8.0"

    s.source        = { :git => "http://git.baijiashilian.com/open-ios/BJLiveBase.git", :tag => s.version.to_s }
    # s.source        = { :git => "git@git.baijiayun.com:iOS/BJLiveBase.git", :tag => s.version.to_s }

    s.pod_target_xcconfig = {
        "GCC_PREPROCESSOR_DEFINITIONS" => "$(inherited) BJLIVEBASE_NAME=#{s.name} BJLIVEBASE_VERSION=#{s.version}"
    }

    s.default_subspecs = ["Base"]

    s.subspec "Base" do |ss|
        ss.source_files = ["Foundation/**/*.{h,m}", "UIKit/**/*.{h,m}"]
        ss.public_header_files = [
            "Foundation/**/*.h",
            "UIKit/**/*.h"
        ]
        ss.frameworks = ["Foundation", "UIKit", "WebKit"]
    end

    s.subspec "Auth" do |ss|
        ss.source_files  = ["Authorization/**/*.{h,m}"]
        ss.public_header_files = ["Authorization/**/*.h"]
        ss.frameworks = ["AVFoundation", "Foundation", "Photos", "UIKit"]
    end

    s.subspec "Ext" do |ss|
        ss.source_files  = ["libextobjc/**/*.{h,m}"]
        ss.public_header_files = ["libextobjc/**/*.h"]
        ss.frameworks = ["Foundation"]
    end

    s.subspec "HUD" do |ss|
        ss.source_files = ["BJLProgressHUD/**/*.{h,m}"]
        ss.public_header_files = ["BJLProgressHUD/**/*.h"]
        ss.frameworks = ["Foundation", "UIKit"]
        ss.dependency "MBProgressHUD", "~> 1.0"
    end

    s.subspec "Log.static" do |ss|
        ss.frameworks = ["AVFoundation"]
        ss.vendored_frameworks = "frameworks/BJLLogStat.framework"
        ss.dependency "AFNetworking"
        ss.dependency "FMDB"
    end
    # s.subspec "Log.dynamic" do |ss|
    #     ss.frameworks = ["AVFoundation"]
    #     ss.vendored_frameworks = "frameworks/dynamic/BJLLogStat.framework"
    #     ss.dependency "AFNetworking"
    #     ss.dependency "FMDB/standalone"
    # end
    # s.subspec "Log.source.static" do |ss|
    #     ss.dependency "BJLLogStat", "~> 0.8.0"
    # end
    # s.subspec "Log.source.dynamic" do |ss|
    #     ss.dependency "BJLLogStat/dynamic", "~> 0.8.0"
    # end

    s.subspec "Masonry" do |ss|
        ss.source_files = ["Masonry+inset/**/*.{h,m}"]
        ss.public_header_files = ["Masonry+inset/**/*.h"]
        ss.frameworks = ["Foundation", "UIKit"]
        ss.dependency "BJLiveBase/Swizzle"
        ss.dependency "Masonry", "~> 1.1"
    end

    s.subspec "Networking" do |ss|
        ss.source_files = ["BJLNetworking/**/*.{h,m}"]
        ss.public_header_files = ["BJLNetworking/**/*.h"]
        ss.frameworks = ["Foundation", "MobileCoreServices", "UIKit"]
        ss.dependency "AFNetworking", "~> 3.0"
    end

    s.subspec "Swizzle" do |ss|
        ss.source_files  = ["JRSwizzle/**/*.{h,m}"]
        ss.public_header_files = ["JRSwizzle/**/*.h"]
        ss.frameworks = ["Foundation"]
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
            sss.dependency "BJLiveBase/WebImage/BJLWebImage"
            sss.dependency "AFNetworking", "~> 3.0"
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

    ## All but NO SDWebImage and YYWebImage
    s.subspec "All-DEPRECATED" do |ss|
        # ss.source_files = ["umbrella/BJLiveBase.{h,m}"]
        # ss.public_header_files = ["umbrella/BJLiveBase.h"]
        ss.dependency "BJLiveBase/Base"
        ss.dependency "BJLiveBase/Auth"
        ss.dependency "BJLiveBase/Ext"
        ss.dependency "BJLiveBase/HUD"
        # ss.dependency "BJLiveBase/Log"
        ss.dependency "BJLiveBase/Masonry"
        ss.dependency "BJLiveBase/Networking"
        # ss.dependency "BJLiveBase/Swizzle"
        ss.dependency "BJLiveBase/WebImage/AFNetworking"
    end

end
