# -*- encoding : utf-8 -*-
  def index
    @<%= instances_name %> = <%= class_name %>.all
  end
