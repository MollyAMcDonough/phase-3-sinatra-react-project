class CreateTaskDefs < ActiveRecord::Migration[6.1]
  def change
    create_table :task_defs do |t|
      t.references :category
      t.references :priority
      t.string :title
      t.string :description
      t.string :rRule
      t.string :location
    end
  end
end
