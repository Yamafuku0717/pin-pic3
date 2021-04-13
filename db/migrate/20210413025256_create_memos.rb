class CreateMemos < ActiveRecord::Migration[6.0]
  def change
    create_table :memos do |t|
      t.text :info
      t.references :picture,    foreign_key: true
      t.float :offsetX,         null: false
      t.float :offsetY,         null: false
      t.timestamps
    end
  end
end
