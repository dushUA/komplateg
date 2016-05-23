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
#  user_id            :integer
#

class OperationsController < ApplicationController
  before_action :signed_in_user
  def index
  end

  def table
    @operations = current_user.operations
    @sum_oper = @operations.map(&:sum_operation).inject(:+)
  end

  def chart
  end

  def show
  end

  def destroy
  end

  def update
  end

  def edit
  end

  def create
  end

end
