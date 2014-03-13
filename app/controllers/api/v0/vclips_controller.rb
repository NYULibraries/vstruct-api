module Api
  module V0
    class VclipsController < ApplicationController

      rescue_from ActiveRecord::RecordNotFound,   with: :rescue_record_not_found
      rescue_from PG::InvalidTextRepresentation,  with: :rescue_bad_request

      respond_to :json
      before_action :set_vstruct, only: [:index, :create]
      before_action :set_vclip,   only: [:show, :update, :destroy]

      # GET /vclips
      def index
        @vclips = @vstruct.vclips
        respond_with @vclips
      end

      # GET /vclips/1
      def show
        respond_with @vclip
      end

      # POST /vclips
      def create
        @vclip = @vstruct.vclips.create(vclip_params)
        respond_with @vclip, location: api_v0_vclip_url(@vclip)
      end

      # PATCH/PUT /vclips/1
      def update
        respond_with @vclip.update(vclip_params)
      end

      # DELETE /vclips/1
      def destroy
        respond_with @vclip.destroy
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_vclip
        @vclip = Vclip.find(params[:id])
      end

      def set_vstruct
        @vstruct = Vstruct.find(params[:vstruct_id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def vclip_params
        params.require(:vclip).permit(:id, :vstruct_id, :time_in, :time_out, :label, :clip_type, :clip_order, :lock_version)
      end
    end
  end
end

