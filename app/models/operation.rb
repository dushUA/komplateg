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

class Operation < ActiveRecord::Base
  belongs_to :user
  belongs_to :acceptor
  belongs_to :payer
  belongs_to :service

  default_scope -> {order :period_pay_start}

  validates :user_id, presence: true
  validates :acceptor_id, presence: true
  validates :payer_id, presence: true
  validates :service_id, presence: true
  validates :sum_operation, presence: true

end
