# -*- encoding : utf-8 -*-
class Regexp #:nodoc:
  def multiline?
    options & MULTILINE == MULTILINE
  end
end
