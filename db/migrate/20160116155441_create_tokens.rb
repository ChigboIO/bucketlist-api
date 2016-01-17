class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.text :value
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
