class TaskTimesController < ApplicationController
    # Get endpoints
    get '/task_times' do
        TaskTime.all.to_json(include: :task_def)
    end
 
    # Post, Patch, Delete endpoints
    delete '/task_times/:id' do
        TaskTime.find(params[:id]).destroy.to_json
    end

    patch '/task_times/:id' do
        task_time = TaskTime.find(params[:id])
        task_time.update(params)
        task_time.to_json
    end

    post '/task_times' do
        columns = TaskDef.column_names
        attributes = {}
        columns.each do |name|
            sym = name.to_sym
            if params.keys.include?(sym)
                attributes[sym] = params[sym]
            end
        end
        task_def_attr
        td = TaskDef.create(attributes)
        TaskTime.create(task_def: td, start: params[:startDate], end: params[:endDate]).to_json
    end

end