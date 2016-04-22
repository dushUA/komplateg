# == Schema Information
#
# Table name: payers
#
#  id         :integer          not null, primary key
#  id_main    :integer
#  fio        :string
#  adress     :string
#  invoice    :string
#  telephone  :string
#  bank_payer :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :payer do
    id_main 1
    fio "MyString"
    adress "MyString"
    invoice "MyString"
    telephone "MyString"
    bank_payer "MyString"
  end
end
