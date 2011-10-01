# -*- encoding : utf-8 -*-
Rails.application.routes.draw do
  match '/rails/info/properties' => "rails/info#properties"
end
