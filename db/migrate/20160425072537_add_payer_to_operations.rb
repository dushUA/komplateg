class AddPayerToOperations < ActiveRecord::Migration
  def change
    add_reference :operations, :payer, index: true, foreign_key: true, on_delete: :cascade, name: 'fk_operations_payer'
  end
end
