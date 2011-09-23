# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{whenever}
  s.version = "0.7.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Javan Makhmali"]
  s.date = %q{2011-09-02 00:00:00.000000000Z}
  s.description = %q{Clean ruby syntax for writing and deploying cron jobs.}
  s.email = ["javan@javan.us"]
  s.executables = ["whenever", "wheneverize"]
  s.files = [".gitignore", ".travis.yml", "CHANGELOG.md", "Gemfile", "LICENSE", "README.md", "Rakefile", "bin/whenever", "bin/wheneverize", "lib/whenever.rb", "lib/whenever/capistrano.rb", "lib/whenever/command_line.rb", "lib/whenever/cron.rb", "lib/whenever/job.rb", "lib/whenever/job_list.rb", "lib/whenever/output_redirection.rb", "lib/whenever/setup.rb", "lib/whenever/version.rb", "test/functional/command_line_test.rb", "test/functional/output_at_test.rb", "test/functional/output_default_defined_jobs_test.rb", "test/functional/output_defined_job_test.rb", "test/functional/output_env_test.rb", "test/functional/output_redirection_test.rb", "test/test_helper.rb", "test/unit/cron_test.rb", "test/unit/job_test.rb", "whenever.gemspec"]
  s.homepage = %q{}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.2}
  s.summary = %q{Cron jobs in ruby.}
  s.test_files = ["test/functional/command_line_test.rb", "test/functional/output_at_test.rb", "test/functional/output_default_defined_jobs_test.rb", "test/functional/output_defined_job_test.rb", "test/functional/output_env_test.rb", "test/functional/output_redirection_test.rb", "test/unit/cron_test.rb", "test/unit/job_test.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<chronic>, ["~> 0.6.3"])
      s.add_runtime_dependency(%q<activesupport>, [">= 2.3.4"])
      s.add_development_dependency(%q<shoulda>, [">= 2.1.1"])
      s.add_development_dependency(%q<mocha>, [">= 0.9.5"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<i18n>, [">= 0"])
    else
      s.add_dependency(%q<chronic>, ["~> 0.6.3"])
      s.add_dependency(%q<activesupport>, [">= 2.3.4"])
      s.add_dependency(%q<shoulda>, [">= 2.1.1"])
      s.add_dependency(%q<mocha>, [">= 0.9.5"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<i18n>, [">= 0"])
    end
  else
    s.add_dependency(%q<chronic>, ["~> 0.6.3"])
    s.add_dependency(%q<activesupport>, [">= 2.3.4"])
    s.add_dependency(%q<shoulda>, [">= 2.1.1"])
    s.add_dependency(%q<mocha>, [">= 0.9.5"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<i18n>, [">= 0"])
  end
end
