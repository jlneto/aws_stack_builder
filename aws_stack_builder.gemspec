
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "aws_stack_builder/version"

Gem::Specification.new do |spec|
  spec.name          = "aws_stack_builder"
  spec.version       = AwsStackBuilder::VERSION
  spec.authors       = ["Neto"]
  spec.email         = ["jose.lopes.santos.neto@gmail.com"]

  spec.summary       = "Gem to create the cloud formation files do create the ROR app stack on AWS"
  spec.description   = "Gem to create the cloud formation files do create the ROR app stack on AWS"
  spec.homepage      = "http://www.mcfox.com.br"
  spec.license       = "MIT"


  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
