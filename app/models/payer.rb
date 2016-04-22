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

class Payer < ActiveRecord::Base
end
