# -*- encoding : utf-8 -*-
module Arel
  module Memory
    class Engine
      def read(relation)
        relation.eval
      end
      alias :create :read
    end
  end
end
