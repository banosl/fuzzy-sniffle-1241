Rails.application.routes.draw do
  resources :dishes, only:[:show]
  resources :chefs, onlyt:[:show]
end
