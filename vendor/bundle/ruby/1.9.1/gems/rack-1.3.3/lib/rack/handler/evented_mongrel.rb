# -*- encoding : utf-8 -*-
require 'swiftcore/evented_mongrel'

module Rack
  module Handler
    class EventedMongrel < Handler::Mongrel
    end
  end
end
