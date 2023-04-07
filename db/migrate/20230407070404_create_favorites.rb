class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      
      # 追加カラム
      t.integer :customer_id,         null: false
      t.integer :post_id,             null: false
      
      
      t.timestamps
    end
  end
end
