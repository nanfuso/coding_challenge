Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get '/forecasts' => 'forecasts#index'
  post '/forecasts' => 'forecasts#create'
  get '/forecasts/:id' => 'forecasts#show'

end
