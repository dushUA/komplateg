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
#  sum_operation      :decimal(12, 2)   default(0.0)
#  currency_operation :string
#  priv_acc_payer     :string
#  period_pay_start   :date
#  period_pay_end     :date
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  payer_id           :integer
#  acceptor_id        :integer
#  service_id         :integer
#  user_id            :integer
#

FactoryGirl.define do
  factory :operation do
    payer
    acceptor
    service
    user
    date_time_pay "2016-04-25 09:44:00"
    date_valut "2016-04-25"
    num_ticket "MyString"
    code_ticket "MyString"
    key_operation "MyString"
    destination "MyText"
    sum_operation "20.54"
    currency_operation "uah"
    priv_acc_payer "MyString"
    period_pay_start "2016-04-01"
    period_pay_end "2016-04-30"
  end
end
