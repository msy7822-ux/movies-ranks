class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :movie_id
      t.text :comment

      t.timestamps
    end
  end
end