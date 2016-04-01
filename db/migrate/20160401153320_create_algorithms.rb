class CreateAlgorithms < ActiveRecord::Migration
  def change
    create_table :algorithms do |t|
      t.text :case, null: false
      t.text :answer, null: false
      t.timestamps null: false
    end
  end
end
