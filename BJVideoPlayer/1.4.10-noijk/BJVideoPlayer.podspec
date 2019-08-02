Pod::Spec.new do |s|
  s.name = 'BJVideoPlayer' 
  s.version = '1.4.10-noijk'
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

  s.default_subspecs = ["static"]
  
  s.subspec "static" do |ss|
    ss.ios.preserve_paths       = 'BJVideoPlayer/BJVideoPlayer.framework'
    ss.ios.public_header_files  = 'BJVideoPlayer/BJVideoPlayer.framework/Versions/A/Headers/**/*.h'
    ss.ios.source_files         = 'BJVideoPlayer/BJVideoPlayer.framework/Versions/A/Headers/**/*.h'
    ss.ios.vendored_frameworks  = 'BJVideoPlayer/BJVideoPlayer.framework'  
    ss.frameworks = ["CoreMedia", "AVFoundation", "AVKit"]
    # ss.dependency "BJVideoPlayer/BJYIJKMediaFramework"
  end
  

  # s.subspec "weak" do |ss|
  #   ss.ios.preserve_paths       = 'BJVideoPlayer/weak/BJVideoPlayer.framework'
  #   ss.ios.public_header_files  = 'BJVideoPlayer/weak/BJVideoPlayer.framework/Versions/A/Headers/**/*.h'
  #   ss.ios.source_files         = 'BJVideoPlayer/weak/BJVideoPlayer.framework/Versions/A/Headers/**/*.h'
  #   ss.ios.vendored_frameworks  = 'BJVideoPlayer/weak/BJVideoPlayer.framework'  
  #   ss.frameworks = ["CoreMedia", "AVFoundation", "AVKit"]
  #   ss.dependency "BJVideoPlayer/IJKMediaFramework.weak"
  # end
  
  # s.subspec 'BJYIJKMediaFramework' do |ss|
  #     ss.frameworks = ["AVFoundation", "GLKit", "VideoToolbox"]
  #     ss.libraries = ["stdc++", "z", "bz2"]
  #     ss.vendored_frameworks = "BJVideoPlayer/BJYIJKMediaFramework.framework"
  #   	ss.xcconfig = {"ENABLE_BITCODE" => "NO"}
  # end

  # s.subspec 'IJKMediaFramework.weak' do |ss|
  #     ss.frameworks = ["AVFoundation", "GLKit", "VideoToolbox"]
  #     ss.libraries = ["stdc++", "z", "bz2"]
  #     ss.source_files = ["BJVideoPlayer/IJKMediaFramework.framework/**/*.h"]
  #     ss.private_header_files = ["BJVideoPlayer/IJKMediaFramework.framework/**/*.h"]
  #     ss.xcconfig = {"ENABLE_BITCODE" => "NO"}
  # end
	

end
