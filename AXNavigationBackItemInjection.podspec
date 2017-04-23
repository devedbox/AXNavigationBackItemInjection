Pod::Spec.new do |s|

s.name         = "AXNavigationBackItemInjection"
s.version      = "0.0.2"
s.summary      = "Custom implementation of back navigation item actions."
s.description  = <<-DESC
                Custom implementation of back navigation item actions using protocol or block.
                DESC
s.homepage     = "https://github.com/devedbox/AXNavigationBackItemInjection"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author             = { "devedbox" => "devedbox@gmail.com" }
s.platform     = :ios, "7.0"
s.source       = { :git => "https://github.com/devedbox/AXNavigationBackItemInjection.git", :tag => s.version }
s.source_files  = "AXNavigationBackItemInjection/AXNavigationBackItemInjection/*.{h,m}"
s.frameworks = "UIKit", "Foundation"
s.requires_arc = true
#s.dependency "AXCollectionViewFlowLayout"
#s.dependency "AXExtensions"

end
