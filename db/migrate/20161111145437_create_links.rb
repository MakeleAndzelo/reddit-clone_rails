class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :title
      t.string :url
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
