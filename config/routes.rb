Rails.application.routes.draw do
  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  get '/' => 'client/products#index'

  namespace :client do
    get '/orders/new' => 'orders#new'
    get '/orders/:id' => 'orders#show'
    post '/orders' => 'orders#create'
  end 


  namespace :client do
    get '/products' => 'products#index'
    get '/products/new' => 'products#new'
    post '/products' => 'products#create'
    get '/products/:id' => 'products#show'
    get '/products/:id/edit' => 'products#edit'
    patch '/products/:id' => 'products#update'
    delete '/products/:id' => 'products#destroy'
  end

  namespace :client do
    get '/carted_products' => 'carted_products#index'
    get '/carted_products/new' => 'carted_products#new'
    post '/carted_products' => 'carted_products#create'
    delete '/carted_products/:id' => 'carted_products#destroy'
  end
end
