class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :todo
      t.boolean :done
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
