# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "xbd/version"

Gem::Specification.new do |s|
  s.name        = "xbd"
  s.version     = Xbd::VERSION
  s.authors     = ["Shane Brinkman-Davis"]
  s.email       = ["shanebdavis@imikimi.com"]
  s.homepage    = "https://github.com/Imikimi-LLC/xbd"
  s.summary     = %q{A fast, simplified, XML-inspired binary file format.}
  s.description = %q{The XBD gem allows you to create, load and save XBD files. XBD files are arbitrary, self-describing, hierarchical, binary data structures consisting of "tags", "attributes", and "sub-tags".}

  s.rubyforge_project = "xbd"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # s.add_dependency 'RubyInline', '~> 3.11.0'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '~> 2.6.0'
end
