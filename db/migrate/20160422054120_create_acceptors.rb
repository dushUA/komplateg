class CreateAcceptors < ActiveRecord::Migration
  def change
    create_table :acceptors do |t|
      t.string :name_acceptor
      t.string :bank_acceptor
      t.string :account_acceptor
      t.string :key_acceptor
      t.string :mfo_acceptor

      t.timestamps null: false
    end
  end
end
