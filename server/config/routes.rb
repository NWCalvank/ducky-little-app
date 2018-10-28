Rails.application.routes.draw do
  get '/parks', to: 'parks#index'
  get '/foods', to: 'foods#index'
  get '/reports', to: 'reports#show'
end
