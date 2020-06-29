Rails.application.routes.draw do
  get 'pages/home'
  devise_for :views
  devise_for :users
  get 'welcome/index'

  resources :articles do
    resources :comments
  end

  root 'welcome#index'
end
