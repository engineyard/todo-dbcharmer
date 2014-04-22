class TasksController < ApplicationController
  def create
    task = Task.on_db(params["db_target"]).create(name: params["task"]["name"])
    render :json => task.to_json
  end
  def index
    result = Task.on_db(:db_a).all.as_json.each{|h| h["source_db"] = "db_a"}
    result += Task.on_db(:db_b).all.as_json.each{|h| h["source_db"] = "db_b"}
    render :json => result
  end
end
