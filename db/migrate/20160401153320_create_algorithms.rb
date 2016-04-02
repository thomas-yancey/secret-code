class CreateAlgorithms < ActiveRecord::Migration
  def change
    create_table :algorithms do |t|
      t.text :question, null: false

      t.string :method_outline, null: false
      t.string :casetests, null: false
      t.string :caseanswers, null: false
      t.timestamps null: false
    end
  end
end
