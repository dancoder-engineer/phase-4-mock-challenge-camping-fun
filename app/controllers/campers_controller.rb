class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :notfound
    def index
        @camperkids = Camper.all
        render json: @camperkids, status: :ok
    end

    def withacts
        camperkid = Camper.find(params[:id])
        render json: camperkid, serializer: CamperidSerializer, status: 200
    end

private

def notfound
    render json: {error: "Camper not found"}, status: 404
end
end
