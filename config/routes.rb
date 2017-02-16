Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  post "/patients", to: 'patient_webclients#create'
 
  get "/patients", to: 'patient_webclients#index'
  get "/patients/new", to: 'patient_webclients#new'
  get "/patients/:id", to: 'patient_webclients#show'

end
