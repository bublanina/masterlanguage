module Mustang
  module V8
    class Number
      include Comparable
      include Delegated

      def <=>(other)
        to_f <=> other
      end

      def delegate
        to_f
      end

      def kind_of?(klass)
        klass == ::Float or super(klass)
      end
    end # Number
  end # V8
end # Mustang
