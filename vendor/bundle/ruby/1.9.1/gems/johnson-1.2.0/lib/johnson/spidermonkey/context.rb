# -*- encoding : utf-8 -*-
module Johnson #:nodoc:
  module SpiderMonkey #:nodoc:
    class Context # native
      def initialize(runtime, options={})
        @runtime = runtime
        initialize_native(runtime, options)
      end
    end
  end
end
