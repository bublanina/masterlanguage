# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{uglifier}
  s.version = "1.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ville Lautanala"]
  s.date = %q{2011-09-04}
  s.email = %q{lautis@gmail.com}
  s.extra_rdoc_files = ["LICENSE.txt", "README.rdoc"]
  s.files = [".document", ".gitmodules", ".rspec", ".travis.yml", "Gemfile", "LICENSE.txt", "README.rdoc", "Rakefile", "VERSION", "build.js", "lib/es5.js", "lib/uglifier.rb", "lib/uglify.js", "spec/spec_helper.rb", "spec/uglifier_spec.rb", "uglifier.gemspec"]
  s.homepage = %q{http://github.com/lautis/uglifier}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.2}
  s.summary = %q{Ruby wrapper for UglifyJS JavaScript compressor}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<execjs>, [">= 0.3.0"])
      s.add_runtime_dependency(%q<multi_json>, [">= 1.0.2"])
      s.add_development_dependency(%q<rspec>, ["~> 2.6.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.0"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<execjs>, [">= 0.3.0"])
      s.add_dependency(%q<multi_json>, [">= 1.0.2"])
      s.add_dependency(%q<rspec>, ["~> 2.6.0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.0"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<execjs>, [">= 0.3.0"])
    s.add_dependency(%q<multi_json>, [">= 1.0.2"])
    s.add_dependency(%q<rspec>, ["~> 2.6.0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.0"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end
