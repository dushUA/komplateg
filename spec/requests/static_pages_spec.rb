require 'rails_helper'

describe 'Static Pages' do
  let(:base_title){'Komplateg'}
  subject {page}

  describe 'Index' do
    before {visit root_path}

    it {should have_content('Komplateg')}
    it {should have_title(full_title(''))}
  end

  describe 'Help' do
    before {visit help_path}

    it {should have_content('Help')}
    it {should have_title(full_title('Help'))}
  end

  describe 'About page' do
    before {visit about_path}

    it {should have_content('About Us')}
    it {should have_title(full_title('About'))}
  end
end