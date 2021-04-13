class CreatePictures < ActiveRecord::Migration[6.0]
  def change
    create_table :pictures do |t|
      t.string :text,              null: false
      t.references :user,          foreign_key: true
      t.string :public_private,    null: false
      t.timestamps
    end
  end
end
