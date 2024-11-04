class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.string :name
      t.string :genre
      t.string :address
      t.text :menu
      t.text :about
      t.string :overall
      t.integer :user_id
      t.integer :level

      t.timestamps
    end
  end
end
