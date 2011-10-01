# -*- encoding : utf-8 -*-
module Treetop
  module Compiler
    class TransientPrefix < ParsingExpression
      def compile(address, builder, parent_expression)
        parent_expression.prefixed_expression.compile(address, builder)
      end
    end
  end
end
