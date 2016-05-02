# == Schema Information
#
# Table name: operations
#
#  id                 :integer          not null, primary key
#  date_time_pay      :datetime
#  date_valut         :date
#  num_ticket         :string
#  code_ticket        :string
#  key_operation      :string
#  destination        :text
#  sum_operation      :money
#  currency_operation :string
#  priv_acc_payer     :string
#  period_pay_start   :date
#  period_pay_end     :date
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  payer_id           :integer
#  acceptor_id        :integer
#  service_id         :integer
#

FactoryGirl.define do
  factory :operation do
    id_payer 1
    id_acceptor 1
    id_service 1
    date_time_pay "2016-04-25 09:44:00"
    date_valut "2016-04-25"
    num_ticket "MyString"
    code_ticket "MyString"
    key_operation "MyString"
    destination "MyText"
    sum_operation ""
    currency_operation "MyString"
    priv_acc_payer "MyString"
    period_pay_start "2016-04-25"
    period_pay_end "2016-04-25"
  end
end
