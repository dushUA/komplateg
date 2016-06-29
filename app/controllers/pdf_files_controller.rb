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

class PdfFilesController < ApplicationController
  def index
    @attached_pdfs = current_user.pdf_files.order('created_at')
  end

  def new
    @attached_pdfs = current_user.pdf_files.new
    @text_pdf =''
  end

  def create
    if params[:pdf_file]
      @attached_pdfs = current_user.pdf_files.new(pdf_files_params)
      if @attached_pdfs.save
        @text_pdf = parse_pdf @attached_pdfs.id
        flash[:success] = 'The PDF was added! Card imported: '+@text_pdf[:added].to_s
        flash[:danger] = 'Card with error: '+@text_pdf[:errors] if @text_pdf[:errors]>0
      end
    else
      flash[:danger] = 'File name is empty'
    end
    redirect_to table_operations_path
  end

private
  def pdf_files_params
    params.require(:pdf_file).permit(:attach_file)
  end
end

