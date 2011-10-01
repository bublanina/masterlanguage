# -*- encoding : utf-8 -*-
class String
  def compact
    self.gsub(/\s+/, ' ')
  end
end
