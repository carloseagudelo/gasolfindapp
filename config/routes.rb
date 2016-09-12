Rails.application.routes.draw do
  #devise_for :users
  # Authentitication
  post 'auth_user' => 'authentication#authenticate_user'
  post 'create' => 'registrations#create'

  #Comments
  get 'comments' => 'comments#index'

  #Vehicle
  get 'vehicle_index' => 'vehicles#index'
  post 'vehicle_create' => 'vehicles#create'
  post 'vehicle_show' => 'vehicles#show'
  put 'vehicle_update' => 'vehicles#update'
  delete 'vehicle_delete' => 'vehicles#delete'

  #FuelStation
  get 'fuelstation_index' => 'fuelstations#index'
  post 'fuelstation_create' => 'fuelstations#create'
  post 'fuelstation_show' => 'fuelstations#show'
  put 'fuelstation_update' => 'fuelstations#update'
  delete 'fuelstation_delete' => 'fuelstations#delete'

end
