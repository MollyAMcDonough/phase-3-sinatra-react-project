class TaskDef < ActiveRecord::Base
    belongs_to :category
    belongs_to :priority
    has_many :task_times
end