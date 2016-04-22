# == Schema Information
#
# Table name: acceptors
#
#  id               :integer          not null, primary key
#  name_acceptor    :string
#  bank_acceptor    :string
#  account_acceptor :string
#  key_acceptor     :string
#  mfo_acceptor     :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryGirl.define do
  factory :acceptor do
    name_acceptor "MyString"
    bank_acceptor "MyString"
    account_acceptor "MyString"
    key_acceptor "MyString"
    mfo_acceptor "MyString"
  end
end
