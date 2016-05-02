class StaticPagesController < ApplicationController
  def index
  end

  def new

  end

  def help

  end

  def about

  end

  def create
    # прямой путь работает, из параметра - нет.
    # надо upload на сервер в темп - парсить - удалять

    # file_field2 =params[:file].original_filename
    # file_field = '/home/dush/Komplateg_Format.pdf'
    # data = File.open(file_field, 'rb')
    # reader = PDF::Reader.new(data)
    # @pdf_stat = [reader.pdf_version,reader.info,reader.metadata,reader.page_count].join('; ')
    # @pdf_text = ''
    # @pdf_fonts = ''
    # reader.pages.each do |page|
    #   @pdf_fonts = file_field2
    #   @pdf_text += page.text
    # end
    # render 'new'

    # File.open(File.expand_path(file_field), 'rb') do |io|
    #   # reader = PDF::Reader.new(io)
    #   io.close
    # end
    #
    # reader.pages.each do |page|
    #   @pdf_fonts = page.fonts
    #   @pdf_text = page.text
    # end
    # @pdf_fonts = 'in search action'
    # @pdf_text = File.expand_path(file_field)
  end
end
