# -*- encoding : utf-8 -*-
require 'stringio'
require 'johnson/parser/syntax_error'

module Johnson
  module Parser
    class << self
      def parse(js, filename = nil, linenum = nil)
        tree = if js.is_a?(String)
          parse_io(StringIO.new(js), filename, linenum)
        else
          parse_io(js, filename, linenum)
        end
        tree.to_mutable_tree
      end

      def parse_io(js, filename = nil, linenum = nil)
        Johnson::SpiderMonkey::ImmutableNode.parse_io(js, filename, linenum)
      end
    end
  end
end
