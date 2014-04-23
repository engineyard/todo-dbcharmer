require "connection_names"

class TasksController < ApplicationController
  def create
    task = Task.on_db(params["db_target"]).create(name: params["task"]["name"])
    render :json => task.to_json
  end
  def index
    result = []
    TodoDbCharmer::ConnectionNames.all.each do |connection|
      result += Task.on_db(connection).all.as_json.each{|h| h["source_db"] = connection || :default}
    end
    render :json => result
  end
end
