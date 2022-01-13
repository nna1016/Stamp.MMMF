Rails.application.routes.draw do

  
  resources :stamps
  resources :site_infos
  get 'users/index'
  get 'users/show'
  resources :prizes
  root 'homes#index'
  devise_for :users, :controllers => {
    :registrations => 'devise_users/registrations'
   }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users
  get 'homes/index'

  get 'setting' => 'homes#setting'

  get 'info' => 'homes#info'

  get 'mmmf_terms' => "helps#mmmf_terms"
  get 'support' => "helps#support"
  get 'contact' => "helps#contact"
  get 'helps/announce' => "helps#announce"

  get '*path', controller: 'application', action: 'render_404'
  post '*not_found', controller: 'application', action: 'routing_error'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
