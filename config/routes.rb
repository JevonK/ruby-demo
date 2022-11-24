Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
    mount Customer => '/customer'
    mount CustomerFollow => '/customer-follow'
    mount CustomerContact => '/customer-contact'
end
