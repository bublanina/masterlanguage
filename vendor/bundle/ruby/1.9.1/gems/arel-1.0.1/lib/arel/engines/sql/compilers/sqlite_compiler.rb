# -*- encoding : utf-8 -*-
module Arel
  module SqlCompiler
    class SQLiteCompiler < GenericCompiler
      def locked
        nil
      end
    end
  end
end
