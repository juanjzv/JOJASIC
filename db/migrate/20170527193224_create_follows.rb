class CreateFollows < ActiveRecord::Migration[5.1]
  def change
    create_table :follows do |t|
      t.references :follower, type: :string, foreign_key: {primary_key: 'email', to_table: :users}, null: false
      t.references :following,type: :string, foreign_key: {primary_key: 'email', to_table: :users}, null: false
      t.index [:follower_id, :following_id], unique: true
      t.timestamps
    end

  end
end
