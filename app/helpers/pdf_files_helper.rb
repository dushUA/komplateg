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

module PdfFilesHelper
  require 'parse_plat'
  def parse_pdf(file_name)
    full_path = "#{Rails.public_path}/system/attach_files/#{file_name}.pdf"
    text = ParsePlat.new(full_path, current_user)
    text.parse_pdf
    return text.out_params
  end
end
