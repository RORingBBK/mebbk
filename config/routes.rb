Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :posts
  resources :projects

  get '*path' => redirect('/')
end
