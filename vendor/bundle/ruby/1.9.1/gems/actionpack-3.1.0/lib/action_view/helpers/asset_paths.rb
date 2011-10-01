# -*- encoding : utf-8 -*-
ActiveSupport::Deprecation.warn "ActionView::Helpers::AssetPaths is deprecated. Please use ActionView::AssetPaths instead."

module ActionView
  module Helpers
    AssetPaths = ::ActionView::AssetPaths
  end
end
