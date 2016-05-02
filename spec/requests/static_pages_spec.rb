describe 'Static Pages' do
  let(:base_title){'Komplateg'}

  describe 'Index' do
    it 'should have content Komplateg' do
      visit '/static_pages/index'
      expect(page).to have_content('Komplateg')
    end

    it "should have base_title " do
      visit '/static_pages/index'
      expect(page).to have_title("#{base_title}")
    end
  end

  describe 'Help' do
    it 'should have content Help' do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end

    it "should have title 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_title("#{base_title} | Help")
    end
  end

  describe 'About page' do
    it 'should have the content "About Us"'do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end

    it "should have title 'About'" do
      visit '/static_pages/about'
      expect(page).to have_title("#{base_title} | About")
    end
  end

end