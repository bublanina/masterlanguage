# -*- encoding : utf-8 -*-
module Arel
  module AliasPredication
    def as other
      Nodes::As.new self, Nodes::SqlLiteral.new(other)
    end
  end
end
