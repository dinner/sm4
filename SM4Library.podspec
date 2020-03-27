#
#  Be sure to run `pod spec lint SM4Library.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name         = "SM4Library"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of SM4Library."
  spec.ios.deployment_target = "9.0"


  spec.description  = <<-DESC
			this is a sm4 library
                   DESC

  spec.homepage     = "https://www.github.com/dinner/sm4"

  spec.license      = "MIT"

  spec.author             = { "" => "" }

  spec.source       = { :git => "https://www.github.com/dinner/sm4.git", :tag => "#{spec.version}" }

  spec.source_files  = "Classes", "sm4Demo/*.{h,m}", "sm4Demo/**/*.{h,m,c}"

  spec.framework  = "UIKit"

end
