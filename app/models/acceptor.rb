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

class Acceptor < ActiveRecord::Base
end
