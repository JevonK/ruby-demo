Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
    mount Admins => '/admins'
    mount Customers => '/customers'
    mount CustomerFollows => '/customer_follows'
    mount CustomerContacts => '/customer_contacts'
    mount Base => '/base'
end
