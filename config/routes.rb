Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  post "/patients", to: 'patient_webclients#create'
  get "/patients", to: 'patient_webclients#index'
  get "/patients/new", to: 'patient_webclients#new'
  get "/patients/:id", to: 'patient_webclients#show'


  get "/patients/:id/edit", to: 'patient_webclients#edit'
  patch "/patients/:id", to: 'patient_webclients#update'
  delete "/patients/:id", to: 'patient_webclients#destroy'


end
