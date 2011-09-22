# -*- encoding : utf-8 -*-
# Load the rails application
require File.expand_path('../application', __FILE__)

ENV[Rails.env] ||= 'production'


# Initialize the rails application
MasterLanguage::Application.initialize!
