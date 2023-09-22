class CvsController < ApplicationController
  before_action :set_cv, only: %i[ show edit update destroy ]

  # GET /cvs or /cvs.json
  def index
    @cvs = Cv.all
  end

  # GET /cvs/1 or /cvs/1.json
  def show
  end

  # GET /cvs/new
  def new
    @cv = Cv.new
  end

  # GET /cvs/1/edit
  def edit
  end

  # POST /cvs or /cvs.json
  def create
    @cv = Cv.new(cv_params)

    respond_to do |format|
      if @cv.save
        format.html { redirect_to cv_url(@cv), notice: "Cv was successfully created." }
        format.json { render :show, status: :created, location: @cv }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cv.errors, status: :unprocessable_entity }
      end
    end
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
