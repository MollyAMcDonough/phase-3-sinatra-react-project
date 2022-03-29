class TaskTime < ActiveRecord::Base
    belongs_to :category
    belongs_to :priority
    belongs_to :task_def

end