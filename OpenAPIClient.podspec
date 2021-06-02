Pod::Spec.new do |s|
  s.name = 'OpenAPIClient'
  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.11'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '3.0'
  s.version = 'v1'
  s.source = { :git => 'git@github.com:OpenAPITools/openapi-generator.git', :tag => 'vv1' }
  s.authors = 'OpenAPI Generator'
  s.license = 'Proprietary'
  s.homepage = 'https://github.com/OpenAPITools/openapi-generator'
  s.summary = 'OpenAPIClient Swift SDK'
  s.source_files = 'Sources/OpenAPIClient/**/*.swift'
  s.dependency 'AnyCodable-FlightSchool', '~> 0.4.0'
end
