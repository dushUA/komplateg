class AddServiceToOperations < ActiveRecord::Migration
  def change
    add_reference :operations, :service, name: 'fk_operations_service', index: true, foreign_key: true, on_delete: :cascade
  end
end
