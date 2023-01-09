Rails.application.routes.draw do
  resources :dishes, only:[:show]
  resources :chefs, only:[:show] do
    resources :ingredients, only:[:index], :controller => "chefs/ingredients"
  end

  # post "/chefs/:id", to: "dish_ingredient"
end
