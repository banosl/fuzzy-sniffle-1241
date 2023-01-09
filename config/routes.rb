Rails.application.routes.draw do
  resources :dishes, only:[:show]
  resources :chefs, only:[:show]

  # post "/chefs/:id", to: "dish_ingredient"
end
