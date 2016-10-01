Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # mount ActionCable.server => "/cable"

  match "/websocket", :to => ActionCable.server, via: [:get, :post]

end
