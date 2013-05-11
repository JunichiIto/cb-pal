CbPal::Application.routes.draw do
  resources :menu, only: [] do
    get :new_bulk_create, on: :collection
    post :bulk_create, on: :collection
  end
  root :to => 'menu#new_bulk_create'
end
