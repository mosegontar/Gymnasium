require('./lib/gymnasium/version')

Gem::Specification.new do |s|
  s.name        = 'gymnasium'
  s.version     = Gymnasium::VERSION
  s.summary     = "Gymnasium"
  s.description = "Easy scratch file maintenance"
  s.authors     = ["Alexander Gontar"]
  s.email       = 'mosegontar@gmail.com'
  s.executables << 'gym'
  s.files       = Dir["{lib}/**/*.rb", "bin/*", "*.md"]
  s.homepage    =
    'http://github.com/mosegontar/gymnasium'
  s.license     = 'MIT'
end
