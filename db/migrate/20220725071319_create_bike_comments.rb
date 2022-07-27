class CreateBikeComments < ActiveRecord::Migration[6.1]
  def change
    create_table :bike_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :bike_id

      t.timestamps
    end
  end
end
