require 'rails_helper'

describe 'Operations pages' do

  subject {page}

  let(:user) {FactoryGirl.create(:user)}

  before(:each) do
    sign_in user
  end

  it 'should have the right links on the layout' do
    visit operations_path
    expect(page).to have_link('Table', href: table_operations_path)
    expect(page).to have_link('Chart', href: chart_operations_path)

    click_link 'Table'
    expect(page).to have_title(full_title('Table'))
    click_link 'Chart'
    expect(page).to have_title(full_title('Chart'))
  end

  describe 'operations' do
    let(:user) { FactoryGirl.create(:user) }
    let(:acceptor) { FactoryGirl.create(:acceptor) }
    let(:payer) { FactoryGirl.create(:payer) }
    let(:service) { FactoryGirl.create(:service) }

    let!(:o1) { FactoryGirl.create(:operation, user: user, acceptor: acceptor, payer: payer, service: service) }
    let!(:o2) { FactoryGirl.create(:operation, user: user, acceptor: acceptor, payer: payer, service: service) }

    describe '/table page' do
      before { visit table_operations_path }

      it { should have_content(o1.date_time_pay) }
      it { should have_content(o2.date_time_pay) }
      it { should have_content(user.operations.count) }
    end
  end
end