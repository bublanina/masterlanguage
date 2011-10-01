# -*- encoding : utf-8 -*-
module Arel
  module Nodes
    class SqlLiteral < String
      include Arel::Expressions
      include Arel::Predications
      include Arel::AliasPredication
      include Arel::OrderPredications
    end
  end
end
