CbPal::Application.routes.draw do
  resources :menus, only: %w(index) do
    get :new_bulk_create, on: :collection
    post :bulk_create, on: :collection
  end
  resources :orders, only: %w(new create)
  root :to => 'menu#new_bulk_create'
end
