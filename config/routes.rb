Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :cvs


  get "/loginform",to: "cv#loginform", as: :loginform
  get "/signupform",to: "cv#signupform"
  get "/error", to: "cv#error"
  post "/signupUser",to: "cv#registerUser"
  post "/loginUser",to: "cv#loginUser"
  get "/home", to: "cv#homepage"
  get "/account", to: "cv#account"
  get "/logout", to: "cv#logout"
  post "/addcv", to: "cv#addcv"
  get "/mycvs", to: "cv#mycvs" 
  root "cv#loginform"

  

end
