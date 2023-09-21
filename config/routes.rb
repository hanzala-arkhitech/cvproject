Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "/loginform",to: "cv#loginform", as: :loginform
  get "/signupform",to: "cv#signupform"
  get "/error", to: "cv#error"
  post "/signupUser",to: "cv#registerUser"
  post "/loginUser",to: "cv#loginUser"
  get "/home", to: "cv#homepage"
  
  root "cv#loginform"
end
