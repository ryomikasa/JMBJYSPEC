Pod::Spec.new do |s|
  s.name = 'BJVideoPlayer' 
  s.version = '1.4.13-weak'
  s.summary = 'BJVideoPlayer SDK.'
  s.license = 'MIT'
  s.authors = {"MingLQ"=>"minglq.9@gmail.com"}
  s.homepage = 'http://www.baijiacloud.com/'
  s.description = 'BJVideoPlayer SDK for iOS.'
  
  s.ios.deployment_target    = '8.0'
  s.requires_arc = true

  # s.ios.vendored_frameworks  = 'BJVideoPlayer-#{s.version}/BJVideoPlayer.framework'

  # git
  s.source = { :git => 'http://git.baijiashilian.com/open-ios/BJVideoPlayerBase.git', :tag => s.version.to_s }

  s.default_subspecs = ["weak"]

  s.subspec "weak" do |ss|
    ss.ios.preserve_paths       = 'BJVideoPlayer/BJVideoPlayer.framework'
    ss.ios.public_header_files  = 'BJVideoPlayer/BJVideoPlayer.framework/Versions/A/Headers/**/*.h'
    ss.ios.source_files         = 'BJVideoPlayer/BJVideoPlayer.framework/Versions/A/Headers/**/*.h'
    ss.ios.vendored_frameworks  = 'BJVideoPlayer/BJVideoPlayer.framework'  
    ss.frameworks = ["CoreMedia", "AVFoundation", "AVKit"]
    ss.dependency "BJVideoPlayer/BJYIJKMediaFramework.weak"
  end
  

  s.subspec 'BJYIJKMediaFramework.weak' do |ss|
      ss.frameworks = ["AVFoundation", "GLKit", "VideoToolbox"]
      ss.libraries = ["c++", "z", "bz2"]
      ss.source_files = ["BJVideoPlayer/BJYIJKMediaFramework.framework/**/*.h"]
      ss.private_header_files = ["BJVideoPlayer/BJYIJKMediaFramework.framework/**/*.h"]
      ss.xcconfig = {"ENABLE_BITCODE" => "NO"}
  end
	

end
