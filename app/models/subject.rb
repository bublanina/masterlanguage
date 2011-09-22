# -*- encoding : utf-8 -*-
class Subject < ActiveRecord::Base
  
  has_and_belongs_to_many :users
  has_many :jobs
  accepts_nested_attributes_for :jobs, :allow_destroy => :false, 
  :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  has_many :buyers, :through=>:jobs
  accepts_nested_attributes_for :buyers, :allow_destroy => :false, 
  :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  
  has_many :events, :dependent=>:destroy

  
end
