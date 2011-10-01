# -*- encoding : utf-8 -*-
module ActiveRecord
  module Associations
    class Preloader
      class HasOneThrough < SingularAssociation #:nodoc:
        include ThroughAssociation
      end
    end
  end
end
