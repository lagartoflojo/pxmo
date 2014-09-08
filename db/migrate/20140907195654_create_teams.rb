class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, index: true, null: false

      t.timestamps null: false
    end
  end
end
