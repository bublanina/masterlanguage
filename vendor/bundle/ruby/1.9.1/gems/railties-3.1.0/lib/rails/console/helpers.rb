# -*- encoding : utf-8 -*-
def helper
  @helper ||= ApplicationController.helpers
end

def controller
  @controller ||= ApplicationController.new
end
