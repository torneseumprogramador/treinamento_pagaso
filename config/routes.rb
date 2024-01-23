Rails.application.routes.draw do
  resources :administradors
  resources :pedidos
  resources :clientes
  root "clientes#index"
  get "/login", to: "login#index"
  post "/login", to: "login#login"
  get "/sair", to: "login#sair"
end
