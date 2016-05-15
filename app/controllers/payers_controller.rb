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

class PayersController < ApplicationController
  before_action :signed_in_user, only: [:index, :show]
  before_action :set_payer, only: [:show]
  def index
    @payers = Payer.all
  end

  def show
    end
private
  def set_payer
    @payer = Payer.find_by_id(params[:id])
  end
  def payer_params
    params.require(:payer).permit(:fio, :adress, :invoice, :telephone, :bank_payer)
  end
end
