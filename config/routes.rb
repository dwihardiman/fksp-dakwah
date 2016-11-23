Rails.application.routes.draw do
  resources :comments
  devise_for :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :members, only: [:index, :show] do
    resources :episodes do
      resources :comments
    end
  end

  authenticated :member do
    root 'members#dasbor', as: "authenticated_root"
  end

  root 'welcome#index'

  resources 'welcome'
end
