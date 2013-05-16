CbPal::Application.routes.draw do
  resources :menus, only: %w(index) do
    get :new_bulk_create, on: :collection
    post :bulk_create, on: :collection
    get :new_reset_all, on: :collection
    post :reset_all, on: :collection
  end
  resources :orders
  root :to => 'orders#new'
end
