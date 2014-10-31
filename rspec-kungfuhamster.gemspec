lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
Gem::Specification.new do |s|
  s.name = 'rspec-kungfuhamster'
  s.version = '0.1.0'
  s.authors = ['Thomas Powell']
  s.email = ['twilliampowell@gmail.com']
  s.homepage = 'https://github.com/stringsn88keys/rspec-kungfuhamster'
  s.license = 'MIT'
  s.summary = 'Rspec kung fu hamster formatter'
  s.description = 'Animated kung fu hamster formatter'
  s.rdoc_options = ['--charset', 'UTF-8']
  s.extra_rdoc_files = %w[README.md LICENSE]
  s.rdoc_options = ['--charset', 'UTF-8']
  s.extra_rdoc_files = %w[README.md LICENSE]
  # Manifest
  s.files = Dir.glob("lib/**/*")
  s.test_files = Dir.glob("{test,spec,features}/**/*")
  s.executables = Dir.glob("bin/*").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
  s.add_dependency 'rspec', '~> 3.0'
end
