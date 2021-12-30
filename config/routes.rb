Rails.application.routes.draw do

  
  resources :site_infos
  get 'users/index'
  get 'users/show'
  resources :prizes
  resources :distributions
  root 'homes#index'
  devise_for :users, :controllers => {
    :registrations => 'devise_users/registrations'
   }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users
  get 'homes/index'
  get 'homes/prizelist'
  get 'homes/qr_list'
  get 'homes/lottery_student_list'
  get 'homes/tyusen'

  get 'friend/form'
  post 'friend/find'
  get 'setting' => 'homes#setting'

  get 'info' => 'homes#info'

  get 'quests/quest'
  get 'mmmf_terms' => "helps#mmmf_terms"
  get 'support' => "helps#support"
  get 'helps/announce' => "helps#announce"
  resources :problems
  get 'q' => 'questions#q'
  get "quests/:id/quest" => "quests#quest"
  get "quests/:id/success/:ans" => "quests#success"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
