Pod::Spec.new do |s|
  s.name          = 'NatDS-Swift'
  s.version       = '2.8.0'
  s.summary       = 'Natura Group Design System'
  s.module_name   = 'NatDS'
  s.description   = <<-DESC
                    Natura Design System helps designers and developers work faster and smarter, ensuring brand consistency and scalability.
                    DESC
  s.homepage      = 'https://www.natura.com.br/'
  s.license       = 'ISC'
  s.author        = { 'Natura Design System' => 'designsystem@natura.net' }

  s.source        = { :git => 'https://github.com/natura-cosmeticos/natds-ios.git', :tag => s.version }
  s.source_files  = 'Sources/**/*.{swift,h,m}'

  s.resources           = ['Sources/**/*.xcassets', 'Sources/Resources/*.{ttf}']
  s.ios.resource_bundle = { 'NatDS' => ['Sources/**/*.png', 'Sources/**/*.{ttf}'] }

  s.swift_version = '5.0' 
  s.platform      = :ios, '10.0'
end
