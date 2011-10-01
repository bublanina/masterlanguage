# -*- encoding : utf-8 -*-
#!/usr/bin/env ruby

# Load the test files from the command line.

ARGV.each { |f| load f unless f =~ /^-/  }
