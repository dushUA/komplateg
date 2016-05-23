# == Schema Information
#
# Table name: pdf_files
#
#  id                       :integer          not null, primary key
#  user_id                  :integer
#  prepared                 :boolean          default(FALSE)
#  attach_file_file_name    :string
#  attach_file_content_type :string
#  attach_file_file_size    :integer
#  attach_file_updated_at   :datetime
#

class PdfFile < ActiveRecord::Base
  has_attached_file :attach_file,:path => ':rails_root/public/system/:attachment/:id.pdf'
  validates_attachment_content_type :attach_file, presence: true,
                                    content_type: ['application/pdf', 'application/x-pdf'], if: :pdf_attached?

  belongs_to :user

  def pdf_attached?
    self.attach_file.file?
  end

end
