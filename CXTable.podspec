#
# Be sure to run `pod lib lint CXTable.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CXTable'
  s.version          = '0.0.1'
  s.summary          = 'A short description of CXTable.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
            CXTable 列表
                       DESC

  s.homepage         = 'https://github.com/shamoshuisheng/CXTable'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'shamoshuisheng' => 'shamoshuisheng@163.com' }
  s.source           = { :git => 'https://github.com/shamoshuisheng/CXTable.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'CXTable/Classes/**/*'
  
   s.resource_bundles = {
     'CXTable' => ['CXTable/Assets/*']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'WMZDialog'
 s.dependency 'MJRefresh'
 s.dependency 'LYEmptyView'
end
