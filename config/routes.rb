Intra::Application.routes.draw do
  match '/suppliers/new/:kind' => 'suppliers#new'

  resources :suppliers do
    post :orders_update, :on => :member
    resources :orders
  end

  root :to => "suppliers#index"
end
