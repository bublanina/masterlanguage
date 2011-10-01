# -*- encoding : utf-8 -*-
require 'test_helper'

class <%= class_name %>Test < ActiveSupport::TestCase
  should "be valid" do
    assert <%= class_name %>.new.valid?
  end
end
