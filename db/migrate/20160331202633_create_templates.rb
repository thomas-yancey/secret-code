class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.text :content, null: false

      t.timestamps null: false
    end
  end
end
