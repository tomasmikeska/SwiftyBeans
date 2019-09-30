Pod::Spec.new do |s|
  s.name         = "SwiftyBeans"
  s.version      = "0.1.3"
  s.summary      = "Declarative view styles with Swift"
  s.description  = "Declarative view styles with Swift. Write reusable, readable and concise styles."
  s.homepage     = "https://github.com/tomasmikeska/SwiftyBeans"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Tomáš Mikeska" => "tomikeska@gmail.com" }
  s.platform     = :ios
  s.platform     = :ios, "10.0"
  s.swift_versions = '4.0'
  s.source       = { :git => "https://github.com/tomasmikeska/SwiftyBeans.git", :tag => "#{s.version}" }
  s.source_files = "Sources/**/*.swift"
end
