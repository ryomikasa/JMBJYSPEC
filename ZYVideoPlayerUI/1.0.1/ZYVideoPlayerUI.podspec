#
# Be sure to run `pod lib lint BJPlayerManagerUI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZYVideoPlayerUI'
  s.version          = '1.0.1'
  s.summary          = 'ZYVideoPlayerUI.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'http://git.baijiashilian.com/open-ios/ZYVideoPlayerUI'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '辛亚鹏' => 'xinyapeng@baijiahulian.com' }
  s.source           = { :git =>  'http://git.baijiashilian.com/open-ios/ZYVideoPlayerUI.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  # s.source_files = 'BJPlayerManagerUI/Classes/**/*' 
  # s.resource_bundles = {
  #   'BJPlayerManagerUI' => ['BJPlayerManagerUI/Assets/*.png']
  # }

  s.default_subspecs = ['static']

    s.subspec 'static' do |ss|
        ss.xcconfig = { "GCC_PREPROCESSOR_DEFINITIONS" => "$(inherited) PODSPEC_NAME=#{s.name} PODSPEC_VERSION=#{s.version}" }
        ss.ios.preserve_paths       = 'frameworks/BJPlayerManagerUI.framework'
        ss.ios.source_files         = 'frameworks/BJPlayerManagerUI.framework/Versions/A/Headers/**/*.h'
        ss.ios.public_header_files  = 'frameworks/BJPlayerManagerUI.framework/Versions/A/Headers/**/*.h'
        ss.ios.resource             = 'frameworks/BJPlayerManagerUI.framework/Versions/A/Resources/BJPlayerManagerUI.bundle'
        ss.ios.vendored_frameworks  = 'frameworks/BJPlayerManagerUI.framework'
        ss.dependency 'BJPlayerManagerCore'
    end

    s.subspec 'weak' do |ss|
        ss.xcconfig = { "GCC_PREPROCESSOR_DEFINITIONS" => "$(inherited) PODSPEC_NAME=#{s.name} PODSPEC_VERSION=#{s.version}" }
        ss.ios.preserve_paths       = 'frameworks/BJPlayerManagerUI.framework'
        ss.ios.source_files         = 'frameworks/BJPlayerManagerUI.framework/Versions/A/Headers/**/*.h'
        ss.ios.public_header_files  = 'frameworks/BJPlayerManagerUI.framework/Versions/A/Headers/**/*.h'
        ss.ios.resource             = 'frameworks/BJPlayerManagerUI.framework/Versions/A/Resources/BJPlayerManagerUI.bundle'
        ss.ios.vendored_frameworks  = 'frameworks/BJPlayerManagerUI.framework'
        ss.dependency 'BJPlayerManagerCore/weak'
    end
    
  s.dependency 'MBProgressHUD'
  s.dependency 'Masonry'
  s.dependency 'BJLiveBase/Masonry'

  s.prefix_header_contents =
    '#import <Masonry/Masonry.h>',
    '#import <MBProgressHUD/MBProgressHUD.h>',
    '#import <Masonry/Masonry.h>',
    '#import <BJPlayerManagerCore/BJPlayerManagerCore.h>'


end
