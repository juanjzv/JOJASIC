class AddUserEmailToInteraction < ActiveRecord::Migration[5.1]
  def change
    add_reference :interactions, :user, type: :string, limit: 50, foreign_key: {primary_key: :email, to_table: :users, on_update: :cascade, on_delete: :cascade}
  end
end
