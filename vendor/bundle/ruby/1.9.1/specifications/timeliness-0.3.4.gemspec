# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{timeliness}
  s.version = "0.3.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Adam Meehan"]
  s.date = %q{2011-05-25}
  s.description = %q{Fast date/time parser with customisable formats, timezone and I18n support.}
  s.email = %q{adam.meehan@gmail.com}
  s.extra_rdoc_files = ["README.rdoc", "CHANGELOG.rdoc"]
  s.files = ["CHANGELOG.rdoc", "LICENSE", "README.rdoc", "Rakefile", "benchmark.rb", "lib/timeliness.rb", "lib/timeliness/core_ext.rb", "lib/timeliness/core_ext/string.rb", "lib/timeliness/definitions.rb", "lib/timeliness/format.rb", "lib/timeliness/format_set.rb", "lib/timeliness/helpers.rb", "lib/timeliness/parser.rb", "lib/timeliness/version.rb", "spec/spec_helper.rb", "spec/timeliness/core_ext/string_spec.rb", "spec/timeliness/definitions_spec.rb", "spec/timeliness/format_set_spec.rb", "spec/timeliness/format_spec.rb", "spec/timeliness/parser_spec.rb", "timeliness.gemspec"]
  s.homepage = %q{http://github.com/adzap/timeliness}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{timeliness}
  s.rubygems_version = %q{1.5.2}
  s.summary = %q{Date/time parsing for the control freak.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
