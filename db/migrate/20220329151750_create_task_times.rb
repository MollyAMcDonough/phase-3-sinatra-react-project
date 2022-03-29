class CreateTaskTimes < ActiveRecord::Migration[6.1]
  def change
    create_table :task_times do |t|
      t.references :task_def
      t.datetime :start
      t.datetime :end
    end
  end
end
