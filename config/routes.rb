Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/brainstorage', as: 'rails_admin'
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_out', to: 'users/sessions#destroy'
  end

  root 'homes#index'

  resources :balance_informations
  resources :aboute_posts
  resources :social_posts
  resources :size_pays
  resources :social_services
  resources :payment_infos
  resources :questions
  resources :question_groups
  resources :documents

  get '/googlee92ee49ba651f9de', to: redirect('/googlee92ee49ba651f9de.html')

  get '/robots.txt' => 'esrc_zbp#robots'

  resources :articles
  match '/articles', to: 'esrc_zbp#articles', via: 'get'

  resources :services
  match '/services', to: 'esrc_zbp#services', via: 'get'

  resources :servicetexts
  match '/servicetexts', to: 'esrc_zbp#servicetexts', via: 'get'

  resources :filials
  match '/filials', to: 'esrc_zbp#filials', via: 'get'

  resources :aboutes
  get '/aboutes', to:  redirect('/aboutes/1'), via: 'get'

  resources :news
  match '/news', to: 'esrc_zbp#news', via: 'get'

  resources :answerposts do
    collection do
      get :index_admin
    end
    member do
      get :answer
    end
  end
  match '/answerposts', to: 'esrc_zbp#answerposts', via: 'get'
end
