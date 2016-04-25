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
