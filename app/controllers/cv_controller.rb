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
    entered_password = params[:loginPwd]

    puts email
    puts entered_password

  
    # Find the user by email
    @user = User.find_by(email: email)

    puts "@user: #{@user}"
    
    if @user
      # Decrypt the stored password
      len = ActiveSupport::MessageEncryptor.key_len
      salt = SecureRandom.random_bytes(len)
      key = ActiveSupport::KeyGenerator.new('password').generate_key(salt, len)
      crypt = ActiveSupport::MessageEncryptor.new(key)
      puts "decryoted @user.password: #{crypt.decrypt_and_verify(@user.password)}"
      decrypted_pwd = crypt.decrypt_and_verify(@user.password)
  
      # Compare the entered password with the decrypted password
      if entered_password == decrypted_pwd
        # Passwords match, user is authenticated
        redirect_to home_path
      else
        # Passwords do not match
        @error = "Wrong Email or Password."
        flash[:error] = @error
        redirect_to loginform_path
      end
    else    
      # User not found by email
      @error = "Wrong Email or Password."
      flash[:error] = @error
      redirect_to loginform_path
    end 
  end
  

end
