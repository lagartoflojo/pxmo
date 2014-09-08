class CreateMutants < ActiveRecord::Migration
  def change
    create_table :mutants do |t|
      t.string :nickname, index: true, null: false
      t.string :real_name, null: false
      t.string :photo_url

      t.timestamps null: false
    end
  end
end
