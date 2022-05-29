class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :notfound
    def index
        camperkids = Camper.all
        render json: camperkids.to_json, except: [:activities], status: :ok
    end

    def show
        camperkid = Camper.find(params[:id])
        render json: camperkid.to_json, status: 200
    end

private

def notfound
    render json: {error: "Camper not found"}, status: 404
end
end
