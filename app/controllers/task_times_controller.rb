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
        tt = TaskTime.find(params[:id])
        td_columns = TaskDef.column_names
        tt_columns = TaskTime.column_names
        td_attr = {}
        tt_attr = {}
        td_columns.each do |name|
            if params.keys.include?(name)
                td_attr[name.to_sym] = params[name]
            end
        end

        if !td_attr.empty?
            td = TaskDef.find(tt.task_def_id)
            td.update(td_attr)
        end

        tt_columns.each do |name|
            if params.keys.include?(name)
                tt_attr[name.to_sym] = params[name]
            end
        end

        if !tt_attr.empty?
            tt.update(tt_attr)
        end
        #binding.pry
        tt.to_json(include: :task_def)
    end

    post '/task_times' do
        binding.pry
        columns = TaskDef.column_names
        attributes = {}
        columns.each do |name|
            if params.keys.include?(name)
                attributes[name.to_sym] = params[name]
            end
        end
        td = TaskDef.create(attributes)
        tt = TaskTime.create(task_def: td, startDate: params[:startDate], endDate: params[:endDate], allDay: params[:allDay])
        tt.to_json(include: :task_def)
    end

end