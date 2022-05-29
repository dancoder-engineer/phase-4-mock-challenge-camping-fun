class ActivitiesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :notfound
    def index
        todo = Activity.all
        render json: todo.to_json, status: 200
    end

    def destroy
        activity = Activity.find(params[:id])
        activity.destroy
        head :no_content
    end

    private

    def notfound
        render json: { "error": "Activity not found"  }, status: 404
    end

end
