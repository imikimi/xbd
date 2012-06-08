# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "xbd/version"

Gem::Specification.new do |s|
  s.name        = "xbd"
  s.version     = Xbd::VERSION
  s.authors     = ["Shane Brinkman-Davis"]
  s.email       = ["shanebdavis@imikimi.com"]
  s.homepage    = ""
  s.summary     = %q{XBD - A hierarchical, self-describing binary format consisting of Tags, Attributes, and SubTags}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "xbd"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'RubyInline', '~> 3.11.0'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '~> 2.6.0'

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
