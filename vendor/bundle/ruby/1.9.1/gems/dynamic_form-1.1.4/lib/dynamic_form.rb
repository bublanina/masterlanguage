# -*- encoding : utf-8 -*-
require "active_model/dynamic_errors"
require 'action_view/helpers/dynamic_form'

class ActionView::Base
  include DynamicForm
end
