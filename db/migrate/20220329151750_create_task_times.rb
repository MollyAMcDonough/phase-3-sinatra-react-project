class CreateTaskTimes < ActiveRecord::Migration[6.1]
  def change
    create_table :task_times do |t|
      t.references :task_def
      t.datetime :startDate
      t.datetime :endDate
      t.boolean :allDay
    end
  end
end
