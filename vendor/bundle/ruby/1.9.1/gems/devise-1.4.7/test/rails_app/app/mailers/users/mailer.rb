# -*- encoding : utf-8 -*-
class Users::Mailer < Devise::Mailer
  default :from => 'custom@example.com'
end
