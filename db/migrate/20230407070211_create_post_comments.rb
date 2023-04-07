class CreatePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|
      
      # 追加カラム
      t.integer :customer_id,         null: false
      t.integer :post_id,             null: false
      t.text :post_comment,           null: false
      
      
      t.timestamps
    end
  end
end
