# -*- encoding : utf-8 -*-
class Buyer < ActiveRecord::Base
  
  has_many :jobs
  accepts_nested_attributes_for :jobs, :allow_destroy => true
  has_many :subjects, :through=>:jobs
  accepts_nested_attributes_for :subjects
  
end
