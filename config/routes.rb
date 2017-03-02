Rails.application.routes.draw do

  # get 'park/index'

  # get 'homepage/index'

  resources :park

  root 'homepage#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
