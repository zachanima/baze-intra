Intra::Application.routes.draw do
  resources :suppliers do
    resources :orders
  end

  root :to => "suppliers#index"
end
