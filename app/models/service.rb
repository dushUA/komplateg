# == Schema Information
#
# Table name: services
#
#  id           :integer          not null, primary key
#  name_service :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Service < ActiveRecord::Base
  has_many :operations

end
