Rails.application.routes.draw do
  resources :balance_informations
  resources :aboute_posts
  resources :social_posts
  resources :size_pays
  resources :social_services
  resources :payment_infos
  resources :questions
  resources :question_groups
  mount Ckeditor::Engine => '/ckeditor'
  root 'homes#index'
 
 
  match '/home', to: 'esrc_zbp#homes', via: 'get'
  match '/signup',  to: 'users#new',  via: 'get'
  match '/contacts',  to: 'esrc_zbp#contacts',  via: 'get'
  
  get '/googlee92ee49ba651f9de', :to => redirect('/googlee92ee49ba651f9de.html')

  get '/robots.txt' => 'esrc_zbp#robots'

  resources :articles
  match '/articles',  to: 'esrc_zbp#articles',  via: 'get'
  
  resources :services
  match '/services',  to: 'esrc_zbp#services',  via: 'get'

  resources :servicetexts
  match '/servicetexts',  to: 'esrc_zbp#servicetexts',  via: 'get'

  resources :users
  match '/users',  to: 'esrc_zbp#users',  via: 'get'

  resources :sessions, only: [:new, :create, :destroy]
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  
  resources :filials
  match '/filials', to: 'esrc_zbp#filials', via: 'get'

  resources :aboutes
  get '/aboutes', to:  redirect('/aboutes/1'), via: 'get'

  resources :votes
  match '/votes', to: 'esrc_zbp#votes', via: 'get'

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

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
