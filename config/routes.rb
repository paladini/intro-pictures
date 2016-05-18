Rails.application.routes.draw do

  # Routes to ActiveAdmin
  get '/admin/companies', to: redirect('/admin/companies/1')
  get '/admin/contatos', to: redirect('/admin/contatos/1')
  post '/load_video' => 'jobs#load_vimeo_video'
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  # Jobs / Messages
  scope "(:locale)", locale: /en|es|pt/ do
    resources :messages, only: [:new, :create]
    resources :jobs, only: [:show]
    get '/locked/:id' => 'jobs#locked'
  end
  
  # Root
  get '/:locale' => 'pages#home'
  root to: "pages#home"
 
end
