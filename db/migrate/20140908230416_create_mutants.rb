class CreateMutants < ActiveRecord::Migration
  def change
    create_table :mutants do |t|
      t.string :nickname
      t.string :real_name
      t.string :photo_url

      t.timestamps null: false
    end
  end
end
