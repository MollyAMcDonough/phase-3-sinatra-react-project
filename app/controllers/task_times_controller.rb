class TaskTimesController < ApplicationController
    # Get endpoints
    get '/task_times' do
        TaskTime.all.to_json(include: :task_def)
    end
 
    # Post, Patch, Delete endpoints
end