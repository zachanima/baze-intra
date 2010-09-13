Intra::Application.routes.draw do
  resources :suppliers

  root :to => "suppliers#index"
end
