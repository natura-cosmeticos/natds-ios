Pod::Spec.new do |s|
  s.name          = "NatDS"
  s.version       = "0.0.4"
  s.summary       = "Natura Group Design System"
  s.description   = <<-DESC
                    Natura Design System helps designers and developers work faster and smarter, ensuring brand consistency and scalability.
                    DESC
  s.homepage      = "https://www.natura.com.br/"
  s.license       = "MIT"
  s.author        = { "Vivian Soares" => "vcsoares@thoughtworks.com" }
  s.source        = { :git => "https://github.com/natura-cosmeticos/natds-ios.git", :tag => s.version }
  s.source_files  = "Sources/**/*.{swift,h,m}"
  s.resource = "Sources/Resources/*.xcassets"
  s.swift_version = "5.0" 
  s.platform     = :ios, "9.0"
end