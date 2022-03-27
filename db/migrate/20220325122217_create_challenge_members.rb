class CreateChallengeMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :challenge_members do |t|
      t.belongs_to :user
      t.belongs_to :challenge
      t.string :link_to_instagram
      t.integer :approve, default: 0

      t.timestamps
    end
  end
end
