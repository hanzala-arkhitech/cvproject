require 'active_support'


class CvController < ApplicationController

  def login
  end

  def signup
  end
  
  def error
  end

  def registerUser
    @email = params[:signupEmail]
    @password = params[:signupPwd]

    @userExists = User.find_by(email:@email)


    if !@userExists
        @user = User.new
        @user.email = params[:signupEmail]
        @user.password = params[:signupPwd]
        @message = "Registration Successfull,"
        flash.now[:success] = @message
        @user.save
        redirect_to signupform_path
    else
        @message = "This user is already registered."
        flash.now[:error] = @message
        redirect_to signupform_path
    end 

  end

  def loginUser
    # Retrieve user's email and entered password
    email = params[:loginEmail]
    password = params[:loginPwd]
  
    # Find the user by email
    @user = User.find_by(email: email)

    if @user && password == @user.password
        redirect_to home_path
    else    
      @error = "Wrong Email or Password."
      flash[:error] = @error
      redirect_to loginform_path
    end 
  end
  

end
