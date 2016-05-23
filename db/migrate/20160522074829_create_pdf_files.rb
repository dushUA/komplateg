class CreatePdfFiles < ActiveRecord::Migration
  def change
    create_table :pdf_files do |t|
      t.references :user, index: true, foreign_key: true
      t.boolean :prepared, default: false
    end
  end
end
