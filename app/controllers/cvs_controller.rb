class CvsController < ApplicationController
  before_action :set_cv, only: %i[ show edit update destroy ]
  
  def loginform
  end

  def signupform
  end

  def homepage
    if cookies[:email]
      render "homepage"
    else
      flash[:error]="Login First."
      render "loginform"
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

  # GET /cvs
  def mycvs
    @cvs = Cv.where(email: cookies[:email])
  end

  # GET /cvs/1 or /cvs/1.json
  def show
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

  # GET /cvs/1/edit
  def edit
  end

  def account
    @email = cookies[:email]
  end

  def logout
    cookies.delete :email
    redirect_to loginform_path
  end

  # PATCH/PUT /cvs/1 or /cvs/1.json
  def update
    respond_to do |format|
      if @cv.update(cv_params)
        format.html { redirect_to cv_url(@cv), notice: "Cv was successfully updated." }
        format.json { render :show, status: :ok, location: @cv }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cvs/1 or /cvs/1.json
  def destroy
    @cv.destroy

    # flash[:success] = "CV Deleted."
  
    respond_to do |format|
      format.html { redirect_to mycvs_url, notice: "Cv was successfully destroyed." }
    end
    # respond_to do |format|
    #   format.html { redirect_to cvs_url, notice: "Cv was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cv
      @cv = Cv.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cv_params
      params.require(:cv).permit(:email, :cvemail, :image, :fullname, :phone, :sociallink, :schoolcollege, :major, :duration, :experience, :skills, :certification)
    end

end