Rails.application.routes.draw do

  # get '/parks/:id' , to:'parks#show'

  # get 'homepage/index'

  resources :parks

  root 'homepage#index'   #can do static#homepage  which will create static folder in views with homepage.html.erb file

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
