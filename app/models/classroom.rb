# -*- encoding : utf-8 -*-
class Classroom < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :events, :dependent=>:destroy
  
end
