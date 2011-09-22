# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  require 'active_support/core_ext'

  
  
  def authenticate_user_or_admin
    if !(user_signed_in? || admin_signed_in?)
      flash[:alert]="Nemáš potrebné práva! Prihlás sa."
      redirect_to :root
    end
  end
  
end
