Intra::Application.routes.draw do
  resources :suppliers do
    post :orders_update, :on => :member
    resources :orders
  end

  root :to => "suppliers#index"
end
