class Category < ActiveRecord::Base
    has_many :task_defs
end