require 'rails_helper'

describe 'Static Pages' do
  subject {page}

  it 'should have the right links on the layout' do
    visit root_path
    click_link 'About'
    expect(page).to have_title(full_title('About'))
    click_link 'Help'
    expect(page).to have_title(full_title('Help'))
    click_link 'Home'
    click_link 'Sign up'
    expect(page).to have_title(full_title('Sign up'))
    click_link 'Komplateg'
    expect(page).to have_title(full_title(''))
  end

  shared_examples_for 'all static pages' do
    it {should have_selector('h1', text: heading)}
    it {should have_title(full_title(page_title))}
  end

  describe 'Index' do
    before {visit root_path}
    let(:heading){'Komplateg'}
    let(:page_title){''}

    it_should_behave_like 'all static pages'
  end

  describe 'Help' do
    before {visit help_path}
    let(:heading){'Help'}
    let(:page_title){'Help'}

    it_should_behave_like 'all static pages'
  end

  describe 'About page' do
    before {visit about_path}
    let(:heading){'About Us'}
    let(:page_title){'About'}

    it_should_behave_like 'all static pages'
  end
end