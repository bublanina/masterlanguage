# -*- encoding : utf-8 -*-
require 'benchmark'

class << Benchmark
  def ms
    1000 * realtime { yield }
  end
end
