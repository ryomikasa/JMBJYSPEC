Pod::Spec.new do |s|
  s.name = 'BJVideoPlayer' 
  s.version = '0.0.28'
  s.summary = 'BJVideoPlayer SDK.'
  s.license = 'MIT'
  s.authors = {"MingLQ"=>"minglq.9@gmail.com"}
  s.homepage = 'http://www.baijiacloud.com/'
  s.description = 'BJVideoPlayer SDK for iOS.'
  
  s.ios.deployment_target    = '8.0'

  # s.ios.vendored_frameworks  = 'BJVideoPlayer-#{s.version}/BJVideoPlayer.framework'

  # git
  s.source = { :git => 'http://git.baijiashilian.com/open-ios/BJVideoPlayerBase.git', :tag => s.version.to_s }
  
  # # framework
  s.ios.preserve_paths       = 'BJVideoPlayer/BJVideoPlayer.framework'
  s.ios.public_header_files  = 'BJVideoPlayer/BJVideoPlayer.framework/Versions/A/Headers/**/*.h'
  s.ios.source_files         = 'BJVideoPlayer/BJVideoPlayer.framework/Versions/A/Headers/**/*.h'
  # s.ios.resource           = 'BJVideoPlayer/BJVideoPlayer.framework/Versions/A/Resources/**/*'
  s.ios.vendored_frameworks  = 'BJVideoPlayer/BJVideoPlayer.framework'  
  
  # # library
  # s.public_header_files = 'BJVideoPlayer/**/*.h'
  # s.source_files = 'BJVideoPlayer/**/*.h'
  # s.vendored_libraries = 'BJVideoPlayer/**/*.a'
  # # s.resources = 'BJVideoPlayer/**/*.bundle'
  
    s.frameworks = ["CoreMedia", "AVFoundation", "AVKit"]
    s.requires_arc = true
#    s.xcconfig     = { "CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" => "YES" }
#	s.xcconfig     = { "ENABLE_BITCODE" => "NO"}

  # s.dependency 'xxxx'
end
