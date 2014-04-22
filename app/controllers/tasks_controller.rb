class TasksController < ApplicationController
  def create
    task = Task.create(name: params["task"]["name"])
    render :json => task.to_json
  end
  def index
    render :json => Task.all.to_json
  end
end
