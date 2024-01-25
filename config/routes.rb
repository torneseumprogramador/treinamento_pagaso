Rails.application.routes.draw do
  resources :administradors
  resources :pedidos
  resources :clientes
  root "clientes#index"
  get "/login", to: "login#index"
  post "/login", to: "login#login"
  get "/sair", to: "login#sair"
  get "/esqueci-senha", to: "login#esqueci"
  post "/recuperar", to: "login#recuperar"
  get "/troca-senha", to: "login#troca_senha"
  post "/altera-senha", to: "login#altera_senha"
end
