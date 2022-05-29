class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :notfound
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        @camperkids = Camper.all
        render json: @camperkids, status: :ok
    end

    def withacts
        camperkid = Camper.find(params[:id])
        render json: camperkid, serializer: CamperidSerializer, status: 200
    end

    def create
        crt = Camper.create(prms)
        if crt.id
            render json: crt, status: 201
        else
            render json: { errors: ["validation errors"]}, status: 422
        end
    end

private

def notfound
    render json: {error: "Camper not found"}, status: 404
end



def prms
    params.permit(:id, :name, :age)
end


def render_unprocessable_entity_response
    render json { "d" }, status: 422
end

end
