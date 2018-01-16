#
# Be sure to run `pod lib lint GodEye.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GodEye'
  s.version          = '2.0.0'
  s.summary          = 'Automaticly display Log,Crash,Network,ANR,Leak,CPU,RAM,FPS,NetFlow,Folder and etc with one line of code based on Swift. Just like God opened his eyes.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Automaticly display Log,Crash,Network,ANR,Leak,CPU,RAM,FPS,NetFlow,Folder and etc with one line of code based on Swift. Just like God opened his eyes..
                       DESC

  s.homepage         = 'https://github.com/homebin/GodEye'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'homebin' => '423170808@qq.com' }
  s.source           = { :git => 'https://github.com/homebin/GodEye.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/zixun_'

  s.ios.deployment_target = '8.0'

  s.source_files = 'GodEye/Classes/**/*'
  
  s.resource_bundles = {
    'GodEye' => ['GodEye/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'

    # s.dependency 'AppBaseKit', '~> 0.2.2'
    s.dependency 'Log4G', '~> 0.2.2', :configurations => ['Debug', 'Release']
    s.dependency 'AppSwizzle', '~> 1.1.2', :configurations => ['Debug', 'Release']
    s.dependency 'AssistiveButton', '~> 1.1.2', :configurations => ['Debug', 'Release']

    s.dependency 'ASLEye', '~> 1.1.1', :configurations => ['Debug', 'Release']
    s.dependency 'CrashEye', '~> 1.1.2', :configurations => ['Debug', 'Release']
    s.dependency 'ANREye', '~> 1.1.1', :configurations => ['Debug', 'Release']
    s.dependency 'SystemEye', '~> 0.2.2', :configurations => ['Debug', 'Release']
    s.dependency 'NetworkEye.swift', '~> 1.1.3', :configurations => ['Debug', 'Release']
    s.dependency 'LeakEye', '~> 1.1.3', :configurations => ['Debug', 'Release']

    s.dependency 'FileBrowser', '~> 0.2.0', :configurations => ['Debug', 'Release']
    s.dependency 'SwViewCapture', '~> 1.0.6', :configurations => ['Debug', 'Release']
    s.dependency 'SQLite.swift', '~> 0.11.1', :configurations => ['Debug', 'Release']
    #s.dependency 'MJRefresh', '~> 3.1.12'
    s.dependency 'ESPullToRefresh', '~> 2.6', :configurations => ['Debug', 'Release']
end
