Rails.application.routes.draw do
  root to: redirect('/api-docs')

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  get '/weather/current', to: 'temperatures#current'
  get '/weather/historical', to: 'temperatures#historical'
  get '/weather/historical/max', to: 'temperatures#historical_max'
  get '/weather/historical/min', to: 'temperatures#historical_min'
  get '/weather/historical/avg', to: 'temperatures#historical_avg'
  get '/weather/by_time(/:timestamp)', to: 'temperatures#by_time'
  get '/health', to: 'temperatures#health'
end
