class SignupsController < ApplicationController

    def create
        crt = Signup.create(prms)
        if crt.id
            render json: crt.activity, status: 201
        else
            render json: { errors: ["validation errors"]}, status: 422
        end
    end

    private


def prms
    params.permit(:id, :time, :camper_id, :activity_id)
end

end
