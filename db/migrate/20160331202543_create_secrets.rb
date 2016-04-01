class CreateSecrets < ActiveRecord::Migration
  def change
    create_table :secrets do |t|
      t.references :sender, index: true, null: false
      t.references :receiver, index: true, null: false
      t.references :message, index: true, null: false
      t.references :algorithm, index: true, null: false
      t.boolean :solved, default: false

      t.timestamps null: false
    end
  end
end
