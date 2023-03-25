class MatelistsController < ApplicationController
  before_action :set_matelist, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /matelists or /matelists.json
  def index
    @matelists = Matelist.where(user_id: current_user.id)
  end

  # GET /matelists/1 or /matelists/1.json
  def show
  end

  # GET /matelists/new
  def new
    @matelist = Matelist.new
  end

  # GET /matelists/1/edit
  def edit
  end

  # POST /matelists or /matelists.json
  def create
    @matelist = Matelist.new(matelist_params)

    respond_to do |format|
      if @matelist.save
        format.html { redirect_to matelist_url(@matelist), notice: "Matelist was successfully created." }
        format.json { render :show, status: :created, location: @matelist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @matelist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matelists/1 or /matelists/1.json
  def update
    respond_to do |format|
      if @matelist.update(matelist_params)
        format.html { redirect_to matelist_url(@matelist), notice: "Matelist was successfully updated." }
        format.json { render :show, status: :ok, location: @matelist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @matelist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matelists/1 or /matelists/1.json
  def destroy
    @matelist.destroy

    respond_to do |format|
      format.html { redirect_to matelists_url, notice: "Matelist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matelist
      @matelist = Matelist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def matelist_params
      params.require(:matelist).permit(:name)
    end
end
