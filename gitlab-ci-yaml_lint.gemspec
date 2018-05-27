
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gitlab/ci/yaml_lint/version"

Gem::Specification.new do |spec|
  spec.name          = "gitlab-ci-yaml_lint"
  spec.version       = Gitlab::Ci::YamlLint::VERSION
  spec.authors       = ["Trevor Vaughan"]
  spec.email         = ["tvaughan@onyxpoint.com"]

  spec.summary       = %q{Validate your gitlab-ci.yml files}
  spec.homepage      = "https://github.com/trevor-vaughan/rubygem-gitlab-ci-yaml_lint"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^#{spec.bindir}/}) { |f| File.basename(f) }
  spec.require_paths = ["lib", 'gitlab_lib']

  spec.add_runtime_dependency "activesupport", "~> 5.0.6"
  spec.add_runtime_dependency "activemodel", "~> 5.0.6"
  spec.add_runtime_dependency "activerecord", "~> 5.0.6"
  spec.add_runtime_dependency "chronic", "~> 0.10.2"
  spec.add_runtime_dependency "chronic_duration", "~> 0.10.6"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
