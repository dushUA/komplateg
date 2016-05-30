require 'rails_helper'

describe PdfFile do
  let(:user) {FactoryGirl.create(:user)}
  let(:path){Rails.root.join('spec/support/files/')}

  before { @uploaded_file = Rack::Test::UploadedFile.new(path+'quittance.pdf', 'application/pdf')
           @pdf_file = user.pdf_files.new(attach_file: @uploaded_file)}

  before(:each) do
    sign_in user
  end

  subject{@pdf_file}

  it { should respond_to(:attach_file) }

  it {should be_valid}

  describe 'when type of file is not application/pdf' do
    before { wrong_file = Rack::Test::UploadedFile.new(path+'icon.ico', 'image/x-icon')
             @pdf_file = user.pdf_files.new(attach_file: wrong_file)}
    it { should_not be_valid }
  end

end