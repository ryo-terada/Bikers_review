class CreateBikes < ActiveRecord::Migration[6.1]
  def change
    create_table :bikes do |t|
      t.string :manufacturer, null: false
      #manufacturer=バイクメーカー名
      t.string :bike_name, null: false
      t.string :first_impression, null: false
      #first_impression=レビュー一覧ページに表示させる短いコメント(第一印象)
      t.text :body, null: false
      #body=レビュー詳細ページに表示させる長いコメント
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
