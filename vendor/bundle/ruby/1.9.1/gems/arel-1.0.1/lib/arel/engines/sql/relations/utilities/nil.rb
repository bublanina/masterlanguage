# -*- encoding : utf-8 -*-
module Arel
  class Nil
    def table_sql(formatter = nil); '' end
    def name; '' end
  end
end
