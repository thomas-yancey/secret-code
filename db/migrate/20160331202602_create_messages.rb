class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :template, index: true, null: false
      t.text :content, null: false

      t.timestamps null: false
    end
  end
end
