class Event < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :classroom
  belongs_to :subject
  
end
