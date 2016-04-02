class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :title, null: false
      t.string :preview_url, null: false
      t.text :content, null: false

      t.timestamps null: false
    end
  end
end
