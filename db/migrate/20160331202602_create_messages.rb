class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :template, index: true, null: false
      t.string :content, null: false

      t.timestamps null: false
    end
  end
end
