class CreateBonds < ActiveRecord::Migration[6.0]
  def change
    create_table :bonds do |t|
      t.bigint :user_id
      t.bigint :friend_id
      t.string :state

      t.timestamps
    end

    add_index :bonds, [:user_id, :friend_id], unique: true
    add_foreign_key :bonds, :users, column: :user_id
    add_foreign_key :bonds, :users, column: :friend_id
  end
end
