class CreatePayers < ActiveRecord::Migration
  def change
    create_table :payers do |t|
      t.integer :id_main
      t.string :fio
      t.string :adress
      t.string :invoice
      t.string :telephone
      t.string :bank_payer

      t.timestamps null: false
    end
  end
end
