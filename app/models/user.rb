# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  
  has_and_belongs_to_many :classrooms
  has_and_belongs_to_many :subjects
  has_many :events, :dependent=>:destroy
  
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # sem treba dat vsetko co sa nahadyuje cez seeds.rb !!!
  attr_accessible :email, :password, :password_confirmation, :remember_me,
        :fname, :lname, :street, :city, :zip, :phone, :prac_pomer, :info, :default_hour_price,
        :subject_ids
  

  #-----validacie---------------------------------------------------------------

  #validates_uniqueness_of :nick

  validates :password, :presence => true,
                       :confirmation => true,
                       :length => {:within => 6..40},
                       :on => :create
  validates :password, :confirmation => true,
                       :length => {:within => 6..40},
                       :allow_blank => true,
                       :on => :update

  
end
