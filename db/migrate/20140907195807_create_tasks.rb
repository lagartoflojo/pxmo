class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :description, null: false
      t.datetime :completed_on
      t.references :team, index: true, null: false

      t.timestamps null: false
    end
    add_foreign_key :tasks, :teams
  end
end
