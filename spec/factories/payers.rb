# == Schema Information
#
# Table name: payers
#
#  id         :integer          not null, primary key
#  id_main    :integer          default(0), not null
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
    fio 'Ivanov Ivan'
    adress 'home adress'
    invoice '1234 **** **** 5678'
    telephone '555-23-46'
    bank_payer 'Test bank'
  end
end
