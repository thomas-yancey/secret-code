class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :template, index: true, null: false
      t.string :content, null: false
      t.string :secret_key

      t.timestamps
    end
  end
end
