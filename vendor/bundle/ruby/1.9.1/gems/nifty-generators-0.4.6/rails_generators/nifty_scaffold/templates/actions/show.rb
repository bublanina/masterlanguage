# -*- encoding : utf-8 -*-
  def show
    @<%= singular_name %> = <%= class_name %>.find(params[:id])
  end
