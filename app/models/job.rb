# -*- encoding : utf-8 -*-
class Job < ActiveRecord::Base
  
  belongs_to :buyer
  accepts_nested_attributes_for :buyer
  belongs_to :subject
  accepts_nested_attributes_for :subject
  
end
