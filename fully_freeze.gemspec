lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "fully_freeze/version"

Gem::Specification.new do |spec|
  spec.name          = "fully_freeze"
  spec.version       = FullyFreeze::VERSION
  spec.authors       = ["PeterCamilleri"]
  spec.email         = ["peter.c.camilleri@gmail.com"]

  spec.summary       = %q{Deep, recursive freeze tools.}
  spec.description   = %q{A deep, recursive freeze and freeze tester.}
  spec.homepage      = "https://github.com/PeterCamilleri/fully_freeze"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
                          f.match(%r{^(test|docs)/})
                        end
  spec.bindir        = "exe"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency 'minitest_visible', "~> 0.1"
  spec.add_development_dependency 'reek', "~> 5.0.2"
  
end
