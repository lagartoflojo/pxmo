class CreateMutants < ActiveRecord::Migration
  def change
    create_table :mutants do |t|
      t.string :name, index: true, null: false
      t.string :photo_url

      t.timestamps null: false
    end
  end
end
