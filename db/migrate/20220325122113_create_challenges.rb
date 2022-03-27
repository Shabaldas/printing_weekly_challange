class CreateChallenges < ActiveRecord::Migration[7.0]
  def change
    create_table :challenges do |t|
      t.string :title
      t.string :description
      t.integer :status
      t.integer :members_count
      t.integer :duration
      t.string :link
      t.float :money_prize
      t.integer :val
      t.integer :type_of_print
      
      t.timestamps
    end
  end
end
