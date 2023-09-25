Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "/loginform",to: "cvs#loginform", as: :loginform
  get "/signupform",to: "cvs#signupform"
  post "/signupUser",to: "cvs#registerUser"
  post "/loginUser",to: "cvs#loginUser"
  get "/home", to: "cvs#homepage"
  get "/account", to: "cvs#account"
  get "/logout", to: "cvs#logout"
  post "/addcv", to: "cvs#addcv"
  get "/mycvs", to: "cvs#mycvs" 
  root "cvs#loginform"
  resources :cvs

end
