# -*- encoding : utf-8 -*-
require 'singleton'

module Arel
  class Nil
    include Relation, Singleton
  end
end
