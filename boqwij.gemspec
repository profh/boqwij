# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "boqwij/version"



Gem::Specification.new do |s|
  s.name        = "boqwij"
  s.version     = Boqwij::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Klingon Code Warrior"]
  s.email       = ["profh@cmu.edu"]
  s.homepage    = "http://rubygems.org/gems/boqwij"
  s.summary     = %q{A series of helpers and extensions I use for solving Project Euler problems and other mathematical diversions.}
  s.description = %q{This is a series of methods and extensions I've written or collected from various sources over time to help me mainly in solving Project Euler problems and other mathematical games.  In case you are wondering about the name, boQwIj is Klingon for _my_assistant_, which is what these methods do for me when solving problems.}

  s.rubyforge_project = "boqwij"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
