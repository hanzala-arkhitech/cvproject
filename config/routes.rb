Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "/loginform",to: "cv#loginform"  
  get "/signupform",to: "cv#signupform"
  post "/signupUser",to: "cv#registerUser"


  root "cv#loginform"
end
