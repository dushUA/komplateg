require 'rails_helper'

RSpec.describe "acceptors/index", type: :view do
  before(:each) do
    assign(:acceptors, [
      Acceptor.create!(
        :name_acceptor => "Name Acceptor",
        :bank_acceptor => "Bank Acceptor",
        :account_acceptor => "Account Acceptor",
        :key_acceptor => "Key Acceptor",
        :mfo_acceptor => "Mfo Acceptor"
      ),
      Acceptor.create!(
        :name_acceptor => "Name Acceptor",
        :bank_acceptor => "Bank Acceptor",
        :account_acceptor => "Account Acceptor",
        :key_acceptor => "Key Acceptor",
        :mfo_acceptor => "Mfo Acceptor"
      )
    ])
  end

  it "renders a list of acceptors" do
    render
    assert_select "tr>td", :text => "Name Acceptor".to_s, :count => 2
    assert_select "tr>td", :text => "Bank Acceptor".to_s, :count => 2
    assert_select "tr>td", :text => "Account Acceptor".to_s, :count => 2
    assert_select "tr>td", :text => "Key Acceptor".to_s, :count => 2
    assert_select "tr>td", :text => "Mfo Acceptor".to_s, :count => 2
  end
end
