Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/' => '/forecasts#index'
  get '/forecasts' => 'forecasts#index'
  get '/forecasts/new' => 'forecasts#new'
  post '/forecasts' => 'forecasts#create'
  get '/forecasts/:id' => 'forecasts#show'
  get '/forecasts/:id/edit' => 'forecasts#edit'

end
