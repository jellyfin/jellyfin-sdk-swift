Pod::Spec.new do |s|
  s.name = 'JellyfinAPI'
  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.11'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '3.0'
  s.version = '10.7.6'
  s.source = { :git => 'git@github.com:OpenAPITools/openapi-generator.git', :tag => 'v10.7.6' }
  s.authors = 'OpenAPI Generator'
  s.license = 'Proprietary'
  s.homepage = 'https://github.com/OpenAPITools/openapi-generator'
  s.summary = 'JellyfinAPI Swift SDK'
  s.source_files = 'Sources/JellyfinAPI/**/*.swift'
  s.dependency 'AnyCodable-FlightSchool', '~> 0.6.1'
end
