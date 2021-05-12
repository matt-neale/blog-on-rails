class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
  
      t.string :title, index: true
      t.text :body, index: true

      t.timestamps
    end
  end
end
