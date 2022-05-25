Rails.application.routes.draw do

  get '/weather/current', to: 'weather_samaras#show'
  get '/weather/historical', to: 'weather_samaras#index'
  get '/weather/historical/max', to: 'weather_samaras#historical_max'
  get '/weather/historical/min', to: 'weather_samaras#historical_min'

  resources :weather_samaras
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
