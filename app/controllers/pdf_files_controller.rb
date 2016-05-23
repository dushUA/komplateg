class PdfFilesController < ApplicationController
  def index
    @attached_pdfs = current_user.pdf_files.order('created_at')
  end

  def new
    @attached_pdfs = current_user.pdf_files.new
  end

  def create
    @attached_pdfs = current_user.pdf_files.new(pdf_files_params)
    if @attached_pdfs.save
      flash[:success] = 'The PDF was added!'
    end
    render 'new'
  end

private
  def pdf_files_params
    params.require(:pdf_file).permit(:attach_file)
  end
end

