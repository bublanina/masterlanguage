# -*- encoding : utf-8 -*-
##
# A section of text that is added to the output document as-is

class RDoc::Markup::Raw

  ##
  # The component parts of the list

  attr_reader :parts

  ##
  # Creates a new Raw containing +parts+

  def initialize *parts
    @parts = []
    @parts.push(*parts)
  end

  ##
  # Appends +text+

  def << text
    @parts << text
  end

  def == other # :nodoc:
    self.class == other.class and text == other.text
  end

  ##
  # Calls #accept_raw+ on +visitor+

  def accept visitor
    visitor.accept_raw self
  end

  ##
  # Appends +other+'s parts

  def merge other
    @parts.push(*other.parts)
  end

  def pretty_print q # :nodoc:
    self.class.name =~ /.*::(\w{4})/i

    q.group 2, "[#{$1.downcase}: ", ']' do
      q.seplist @parts do |part|
        q.pp part
      end
    end
  end

  ##
  # Appends +texts+ onto this Paragraph

  def push *texts
    self.parts.push(*texts)
  end

  ##
  # The raw text

  def text
    @parts.join ' '
  end

end

