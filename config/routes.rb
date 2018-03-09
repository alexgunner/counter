Rails.application.routes.draw do
  root 'main#index'

  resources :sensors
  resources :stores

  get '/count_entrance/:id' => 'main#count_entrance'
  get '/count_registers' => 'main#count_registers'
  get '/connection_check/:id' => 'main#connection_check'
  get '/reports' => 'main#reports'

  # Reports URIs
  get '/daily_reports' => 'main#daily_reports'
  get '/date_reports' => 'main#date_reports'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

