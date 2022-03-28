class Task < ActiveRecord::Base
    belongs_to :start_day, class_name: 'Day'
    belongs_to :end_day, class_name: 'Day'
    belongs_to :category
    belongs_to :priority
    belongs_to :repeated_task
    
    #Task class methods

    #Getter methods
    # def self.get_by_priority (priority:, start_day: nil, end_day: nil)
    # end

    # def self.get_by_category (category:, start_day: nil, end_day: nil)
    # end

    # def self.get_by_day (day)
    # end

    #Setter methods
    #for now I'm going to name the create methods something different than the active record default create method but I'll look up how to inherit that behavior and build on it later
    # def self.create_task (start_day:, end_day:, start_time:, end_time:, title:, background_task: false priority: Priority.find_by(description: 'Medium'), category: nil, description: nil, location: nil, repeated_task: nil)
    #     #if start_day or end_day are a special date, check if user wants to add tasks to day_instance with special_date_desc
    #     #if task isn't a background_task, make sure there are no other tasks scheduled for that day/time
    #     #require attributes I haven't set to default values?
    #     #have task go all day if times aren't given?
    #     #have end_day match start_day if not given?
    # end

end