class AddAttachmentAttachFileToPdfFiles < ActiveRecord::Migration
  def self.up
    change_table :pdf_files do |t|
      t.attachment :attach_file
    end
  end

  def self.down
    remove_attachment :pdf_files, :attach_file
  end
end
