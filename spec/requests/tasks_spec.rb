require 'spec_helper'

describe "tasks" do
  it "creates a task and then fetches tasks" do
    expect {
      post "/tasks.json", task: {name: "post to database"}
    }.to change(Task, :count).by(1)

    task = Task.last

    task_response = JSON.parse(response.body)
    expect(task_response["id"]).to eq task.id
    expect(task_response["name"]).to eq "post to database"

    get "/tasks.json"
    tasks_response = JSON.parse(response.body)
    tasks_response.count.should eq Task.count
    task_response = tasks_response.last

    expect(task_response["id"]).to eq task.id
    expect(task_response["name"]).to eq "post to database"
  end

  it "creates a task in a given database" do
    expect{
      post "/tasks.json", task: {name: "post to db_a"}, db_target: "db_a"
    }.to change(Task.on_db(:db_a), :count).by(1)

    task_a = Task.on_db(:db_a).last

    expect{
      post "/tasks.json", task: {name: "post to db_b"}, db_target: "db_b"
    }.to change(Task.on_db(:db_b), :count).by(1)

    get "/tasks.json"
    tasks_response = JSON.parse(response.body)
    tasks_response.count.should == Task.on_db(:db_a).count + Task.on_db(:db_b).count

    task_a_response = tasks_response.find {|t| t["id"] = task_a.id}
    task_a_response["source_db"].should == "db_a"
  end
end
