class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.references :list, foreign_key: true
      t.string :description
      t.boolean :completed

      t.timestamps
    end
  end
end
