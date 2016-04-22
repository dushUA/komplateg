require 'rails_helper'

RSpec.describe "acceptors/show", type: :view do
  before(:each) do
    @acceptor = assign(:acceptor, Acceptor.create!(
      :name_acceptor => "Name Acceptor",
      :bank_acceptor => "Bank Acceptor",
      :account_acceptor => "Account Acceptor",
      :key_acceptor => "Key Acceptor",
      :mfo_acceptor => "Mfo Acceptor"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name Acceptor/)
    expect(rendered).to match(/Bank Acceptor/)
    expect(rendered).to match(/Account Acceptor/)
    expect(rendered).to match(/Key Acceptor/)
    expect(rendered).to match(/Mfo Acceptor/)
  end
end
