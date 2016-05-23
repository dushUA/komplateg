class AddUserToOperations < ActiveRecord::Migration
  def change
    add_reference :operations, :user, index: true, foreign_key: true, on_delete: :cascade, name: 'fk_operations_user'
  end
end
