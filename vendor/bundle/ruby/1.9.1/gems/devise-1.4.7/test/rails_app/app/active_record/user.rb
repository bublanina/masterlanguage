# -*- encoding : utf-8 -*-
require 'shared_user'

class User < ActiveRecord::Base
  include Shim
  include SharedUser
end
