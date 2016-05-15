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
    name_acceptor 'Test Acceptor'
        bank_acceptor 'Bank acceptor'
        account_acceptor 'Account acceptor'
        key_acceptor 'Key acceptor'
        mfo_acceptor 'MFO acceptor'
  end
end
