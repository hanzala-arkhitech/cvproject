require 'active_support'

class CvController < ApplicationController

  def loginform
  end

  def signupform
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
        flash[:success] = @message
        @user.save
        redirect_to signupform_path
    else
        @message = "This user is already registered."
        flash[:error] = @message
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
      cookies[:email] = email
      redirect_to home_path
    else    
      @error = "Wrong Email or Password."
      flash[:error] = @error
      redirect_to loginform_path
    end 
  end
  
  def account
    @email = cookies[:email]
  end

  def logout
    cookies.delete :email
    redirect_to loginform_path
  end

  def homepage
    if cookies[:email]
      render "homepage"
    else
      flash[:error]="Login First."
      render "loginform"
    end
  end

  def addcv
    @cv = Cv.new
    @cv.email = cookies[:email]
    @cv.cvemail = params[:email]
    @cv.fullname = params[:fullname]
    @cv.phone = params[:phone]
    @cv.sociallink = params[:sociallink]
    @cv.schoolcollege = params[:schoolcollege]
    @cv.major = params[:major]
    @cv.duration = params[:duration]
    @cv.experience = params[:experience]
    @cv.skills = params[:skills]
    @cv.certification = params[:certification]
    
    if @cv.save
      flash[:success] = "CV Saved Successfully."
      redirect_to home_path
    else
      flash[:error] = "There was an error while saving your CV."
      redirect_to home_path
    end
  end

  def mycvs
    @cvs = Cv.where(email: cookies[:email])
  end

  def destroy
  end

end
