Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
    mount Admins => '/admins'
    mount Customers => '/customers'
    mount CustomerFollows => '/customer-follows'
    mount CustomerContacts => '/customer-contacts'
end
