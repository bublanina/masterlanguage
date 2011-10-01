# -*- encoding : utf-8 -*-
require 'swiftcore/swiftiplied_mongrel'

module Rack
  module Handler
    class SwiftipliedMongrel < Handler::Mongrel
    end
  end
end
