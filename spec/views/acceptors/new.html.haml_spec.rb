require 'rails_helper'

RSpec.describe "acceptors/new", type: :view do
  before(:each) do
    assign(:acceptor, Acceptor.new(
      :name_acceptor => "MyString",
      :bank_acceptor => "MyString",
      :account_acceptor => "MyString",
      :key_acceptor => "MyString",
      :mfo_acceptor => "MyString"
    ))
  end

  it "renders new acceptor form" do
    render

    assert_select "form[action=?][method=?]", acceptors_path, "post" do

      assert_select "input#acceptor_name_acceptor[name=?]", "acceptor[name_acceptor]"

      assert_select "input#acceptor_bank_acceptor[name=?]", "acceptor[bank_acceptor]"

      assert_select "input#acceptor_account_acceptor[name=?]", "acceptor[account_acceptor]"

      assert_select "input#acceptor_key_acceptor[name=?]", "acceptor[key_acceptor]"

      assert_select "input#acceptor_mfo_acceptor[name=?]", "acceptor[mfo_acceptor]"
    end
  end
end
