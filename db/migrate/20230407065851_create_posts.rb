class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      
      # 追加カラム
      t.integer :customer_id,      null: false
      t.string :game_name,         null: false
      t.string :title,             null: false
      t.text :body,                null: false
      
      
      t.timestamps
    end
    
    # インデックス追加記述
    add_index :posts, :game_name
    
  end
end
