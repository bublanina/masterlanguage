# -*- encoding : utf-8 -*-
  def index
    @<%= plural_name %> = <%= class_name %>.all
  end
