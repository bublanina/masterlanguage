# -*- encoding : utf-8 -*-
module Nokogiri
  module XML
    class CharacterData < Nokogiri::XML::Node
      include Nokogiri::XML::PP::CharacterData
    end
  end
end
