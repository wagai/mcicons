# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mcicons/version"

Gem::Specification.new do |spec|
  spec.name          = "mcicons"
  spec.version       = Mcicons::VERSION
  spec.authors       = ["hirotaka"]
  spec.email         = ["hirotaka.wagai@gmail.com"]

  spec.summary       = %q{mcicons.}
  spec.description   = %q{Making Mac Icons File.}
  spec.homepage      = "https://github.com/Hirotacas/mcicons"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.1.4"
  spec.add_development_dependency "rake", "~> 13.0.1"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "mini_magick"
  spec.add_development_dependency "yard"
end
