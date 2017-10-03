class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    
    create_table :users do |t|
      t.string :login, null: false
      t.timestamps
    end
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.inet :ip, null: false
      t.timestamps
      t.references :user, index: true, foreign_key: true
    end

   

    create_table :ratings do |t|
      t.integer :grade
      t.timestamps
      t.references :post, index: true, foreign_key: true
    end
  end
end
