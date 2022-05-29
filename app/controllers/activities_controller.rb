class ActivitiesController < ApplicationController
    def index
        todo = Activity.all
        render json: todo.to_json, status: 200
    end
end
