require 'rails_helper'

RSpec.describe "acceptors/edit", type: :view do
  before(:each) do
    @acceptor = assign(:acceptor, Acceptor.create!(
      :name_acceptor => "MyString",
      :bank_acceptor => "MyString",
      :account_acceptor => "MyString",
      :key_acceptor => "MyString",
      :mfo_acceptor => "MyString"
    ))
  end

  it "renders the edit acceptor form" do
    render

    assert_select "form[action=?][method=?]", acceptor_path(@acceptor), "post" do

      assert_select "input#acceptor_name_acceptor[name=?]", "acceptor[name_acceptor]"

      assert_select "input#acceptor_bank_acceptor[name=?]", "acceptor[bank_acceptor]"

      assert_select "input#acceptor_account_acceptor[name=?]", "acceptor[account_acceptor]"

      assert_select "input#acceptor_key_acceptor[name=?]", "acceptor[key_acceptor]"

      assert_select "input#acceptor_mfo_acceptor[name=?]", "acceptor[mfo_acceptor]"
    end
  end
end
