require 'active_support'


class CvController < ApplicationController

  def login
  end

  def signup
  end

  def registerUser
    @user = User.new
    @user.email = params[:signupEmail]

    # Encrypt the Password
    key = SecureRandom.random_bytes(32)
    crypt = ActiveSupport::MessageEncryptor.new(key)
    encrypted_pwd = crypt.encrypt_and_sign(params[:signupPwd])

    # Add encrypted password to user
    @user.password = encrypted_pwd
    @user.save

  end 

end
