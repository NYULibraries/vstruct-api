module Api
  module V0
    class VstructsController < ApplicationController

      respond_to :json
      before_action :set_vstruct, only: [:show, :update, :destroy]

      # GET /vstructs
      def index
        @vstructs = Vstruct.all
        respond_with @vstructs
      end

      # GET /vstructs/1
      def show
        respond_with @vstruct
      end

      # POST /vstructs
      def create
        @vstruct = Vstruct.create(vstruct_params)
        respond_with @vstruct, location: api_v0_vstruct_url(@vstruct)
      end

      # PATCH/PUT /vstructs/1
      def update
        respond_with @vstruct.update(vstruct_params)
      end

      # DELETE /vstructs/1
      def destroy
        respond_with @vstruct.destroy
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_vstruct
        @vstruct = Vstruct.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def vstruct_params
        params.require(:vstruct).permit(:id, :label, :streaming_fname, :digitization_notes, :status)
      end

    end
  end
end
