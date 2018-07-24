#
# Be sure to run `pod lib lint RlmSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RlmSDK'
  s.version          = '0.1.0'
  s.summary          = 'A short description of RlmSDK.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://phamducmanh1989@github.com/phamducmanh1989/RlmSDK'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Manh Pham' => 'phamducmanh1989@gmail.com' }
  s.source           = { :git => 'https://phamducmanh1989@github.com/phamducmanh1989/RlmSDK.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.public_header_files = [
  ]
  s.source_files = 'RlmSDK/Classes/**/*.{h,m}'
  s.subspec 'RlmSDKSubSpec' do |sub_spec|
      sub_spec.dependency 'ReactiveObjC', '~>2.1.2'   
  end
  s.static_framework = true
  s.default_subspec = 'RlmSDKSubSpec'
  s.resources = ['RlmSDK/Assets/*.png', 'RlmSDK/Assets/*.bundle']
  s.resource_bundles = {
        'RlmSDK' => ['RlmSDK/Assets/*.png', 'RlmSDK/Assets/*.bundle']
    }
    s.prefix_header_contents =  '#import <ReactiveObjC/ReactiveObjC.h>'
end
