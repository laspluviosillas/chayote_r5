Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions" }
  root to: "home#index"

  namespace :admin do
    resources :members
    resources :projects
    resources :users
    get 'projects/:id/add_user' => "projects#add_user"
    get 'projects/:id/remove_user' => "projects#remove_user"
  end
  resources :projects do
    resources :tasks
  end
  resources :tasks do
    resources :time_entries
  end
  resources :time_entries

  get 'invoice/new' => "invoice#new", :as => :new_invoice
  post 'invoice/show' => "invoice#show", :as => :invoice
end
