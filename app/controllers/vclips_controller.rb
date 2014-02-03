class VclipsController < ApplicationController
  before_action :set_vclip, only: [:show, :edit, :update, :destroy]

  # GET /vclips
  # GET /vclips.json
  def index
    @vclips = Vclip.all
  end

  # GET /vclips/1
  # GET /vclips/1.json
  def show
  end

  # GET /vclips/new
  def new
    @vclip = Vclip.new
  end

  # GET /vclips/1/edit
  def edit
  end

  # POST /vclips
  # POST /vclips.json
  def create
    @vclip = Vclip.new(vclip_params)

    respond_to do |format|
      if @vclip.save
        format.html { redirect_to @vclip, notice: 'Vclip was successfully created.' }
        format.json { render action: 'show', status: :created, location: @vclip }
      else
        format.html { render action: 'new' }
        format.json { render json: @vclip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vclips/1
  # PATCH/PUT /vclips/1.json
  def update
    respond_to do |format|
      if @vclip.update(vclip_params)
        format.html { redirect_to @vclip, notice: 'Vclip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vclip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vclips/1
  # DELETE /vclips/1.json
  def destroy
    @vclip.destroy
    respond_to do |format|
      format.html { redirect_to vclips_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vclip
      @vclip = Vclip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vclip_params
      params.require(:vclip).permit(:vstruct_id, :time_in, :time_out, :label, :type, :clip_order, :lock_version)
    end
end
