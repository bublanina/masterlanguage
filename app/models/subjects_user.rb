# -*- encoding : utf-8 -*-
class SubjectsUser < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :subject
  
end