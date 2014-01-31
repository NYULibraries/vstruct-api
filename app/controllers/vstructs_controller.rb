class VstructsController < ApplicationController
  before_action :set_vstruct, only: [:show, :edit, :update, :destroy]

  # GET /vstructs
  # GET /vstructs.json
  def index
    @vstructs = Vstruct.all
  end

  # GET /vstructs/1
  # GET /vstructs/1.json
  def show
  end

  # GET /vstructs/new
  def new
    @vstruct = Vstruct.new
  end

  # GET /vstructs/1/edit
  def edit
  end

  # POST /vstructs
  # POST /vstructs.json
  def create
    @vstruct = Vstruct.new(vstruct_params)

    respond_to do |format|
      if @vstruct.save
        format.html { redirect_to @vstruct, notice: 'Vstruct was successfully created.' }
        format.json { render action: 'show', status: :created, location: @vstruct }
      else
        format.html { render action: 'new' }
        format.json { render json: @vstruct.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vstructs/1
  # PATCH/PUT /vstructs/1.json
  def update
    respond_to do |format|
      if @vstruct.update(vstruct_params)
        format.html { redirect_to @vstruct, notice: 'Vstruct was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vstruct.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vstructs/1
  # DELETE /vstructs/1.json
  def destroy
    @vstruct.destroy
    respond_to do |format|
      format.html { redirect_to vstructs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vstruct
      @vstruct = Vstruct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vstruct_params
      params.require(:vstruct).permit(:label, :streaming_fname, :digitization_notes, :status)
    end
end
