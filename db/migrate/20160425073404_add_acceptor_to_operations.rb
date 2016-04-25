class AddAcceptorToOperations < ActiveRecord::Migration
  def change
    add_reference :operations, :acceptor, index: true, foreign_key: true, on_delete: :cascade, name: 'fk_operations_acceptor'
  end
end
