Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/index'


  resources :posts
  resources :projects
  resources :contacts, only: [:new, :create]
end
