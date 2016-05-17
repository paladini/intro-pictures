Rails.application.routes.draw do

  # get 'pages/home'

  # Routes to ActiveAdmin
  get '/admin/companies', to: redirect('/admin/companies/1')
  get '/admin/contatos', to: redirect('/admin/contatos/1')
  post '/load_video' => 'jobs#load_vimeo_video'
  ActiveAdmin.routes(self)
  
  # Routes do admin_users
  devise_for :admin_users, ActiveAdmin::Devise.config
  resources :messages, only: [:new, :create]

  # Jobs
  scope "(:locale)", locale: /en|es|pt/ do
    resources :jobs, only: [:show]
    get '/locked/:id' => 'jobs#locked'
  end
  
  # Jobs
  # resources :jobs, only: [:show]
  # post '/jobs/' => 'jobs#show'
  # post '/jobs/private/' => 'jobs#locked'

  # Root
  get '/:locale' => 'pages#home'
  root to: "pages#home"
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
