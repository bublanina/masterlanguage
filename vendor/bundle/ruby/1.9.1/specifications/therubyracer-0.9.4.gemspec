# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{therubyracer}
  s.version = "0.9.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Charles Lowell", "Bill Robertson"]
  s.date = %q{2011-08-22}
  s.default_executable = %q{therubyracer}
  s.description = %q{Call javascript code and manipulate javascript objects from ruby. Call ruby code and manipulate ruby objects from javascript.}
  s.email = %q{cowboyd@thefrontside.net}
  s.executables = ["therubyracer"]
  s.extensions = ["ext/v8/extconf.rb"]
  s.files = [".gitignore", ".gitmodules", ".rspec", ".yardopts", "Changelog.md", "Gemfile", "README.md", "Rakefile", "bin/therubyracer", "ext/v8/extconf.rb", "ext/v8/rr.cpp", "ext/v8/rr.h", "ext/v8/v8.cpp", "ext/v8/v8_array.cpp", "ext/v8/v8_array.h", "ext/v8/v8_callbacks.cpp", "ext/v8/v8_callbacks.h", "ext/v8/v8_context.cpp", "ext/v8/v8_context.h", "ext/v8/v8_date.cpp", "ext/v8/v8_date.h", "ext/v8/v8_debug.cpp", "ext/v8/v8_debug.h", "ext/v8/v8_exception.cpp", "ext/v8/v8_exception.h", "ext/v8/v8_external.cpp", "ext/v8/v8_external.h", "ext/v8/v8_function.cpp", "ext/v8/v8_function.h", "ext/v8/v8_handle.cpp", "ext/v8/v8_handle.h", "ext/v8/v8_locker.cpp", "ext/v8/v8_locker.h", "ext/v8/v8_message.cpp", "ext/v8/v8_message.h", "ext/v8/v8_object.cpp", "ext/v8/v8_object.h", "ext/v8/v8_script.cpp", "ext/v8/v8_script.h", "ext/v8/v8_string.cpp", "ext/v8/v8_string.h", "ext/v8/v8_template.cpp", "ext/v8/v8_template.h", "ext/v8/v8_try_catch.cpp", "ext/v8/v8_try_catch.h", "ext/v8/v8_v8.cpp", "ext/v8/v8_v8.h", "ext/v8/v8_value.cpp", "ext/v8/v8_value.h", "ext/v8/v8_weakref.cpp", "ext/v8/v8_weakref.h", "lib/v8.rb", "lib/v8/access.rb", "lib/v8/array.rb", "lib/v8/c/locker.rb", "lib/v8/cli.rb", "lib/v8/context.rb", "lib/v8/error.rb", "lib/v8/function.rb", "lib/v8/object.rb", "lib/v8/portal.rb", "lib/v8/portal/caller.rb", "lib/v8/portal/constructor.rb", "lib/v8/portal/function.rb", "lib/v8/portal/interceptors.rb", "lib/v8/portal/proxies.rb", "lib/v8/portal/templates.rb", "lib/v8/stack.rb", "lib/v8/tap.rb", "lib/v8/version.rb", "spec/ext/array_spec.rb", "spec/ext/cxt_spec.rb", "spec/ext/ext_spec_helper.rb", "spec/ext/func_spec.rb", "spec/ext/object_spec.rb", "spec/ext/string_spec.rb", "spec/ext/try_catch_spec.rb", "spec/redjs_helper.rb", "spec/spec_helper.rb", "spec/v8/error_spec.rb", "spec/v8/portal/proxies_spec.rb", "specmem/handle_memspec.rb", "specmem/object_memspec.rb", "specmem/proxies_memspec.rb", "specmem/spec_helper.rb", "specthread/spec_helper.rb", "specthread/threading_spec.rb", "therubyracer.gemspec", "spec/redjs/.gitignore", "spec/redjs/README.txt", "spec/redjs/jsapi_spec.rb", "spec/redjs/loadme.js"]
  s.homepage = %q{http://github.com/cowboyd/therubyracer}
  s.require_paths = ["lib", "ext"]
  s.rubyforge_project = %q{therubyracer}
  s.rubygems_version = %q{1.5.2}
  s.summary = %q{Embed the V8 Javascript interpreter into Ruby}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<libv8>, ["~> 3.3.10"])
      s.add_development_dependency(%q<rake>, ["~> 0.9.1"])
      s.add_development_dependency(%q<rspec>, ["~> 2.0"])
      s.add_development_dependency(%q<rake-compiler>, [">= 0"])
    else
      s.add_dependency(%q<libv8>, ["~> 3.3.10"])
      s.add_dependency(%q<rake>, ["~> 0.9.1"])
      s.add_dependency(%q<rspec>, ["~> 2.0"])
      s.add_dependency(%q<rake-compiler>, [">= 0"])
    end
  else
    s.add_dependency(%q<libv8>, ["~> 3.3.10"])
    s.add_dependency(%q<rake>, ["~> 0.9.1"])
    s.add_dependency(%q<rspec>, ["~> 2.0"])
    s.add_dependency(%q<rake-compiler>, [">= 0"])
  end
end
