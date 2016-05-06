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

require 'rails_helper'

RSpec.describe "Acceptors", type: :request do
  describe "GET /acceptors" do
    it "works! (now write some real specs)" do
      get acceptors_path
      expect(response).to have_http_status(200)
    end
  end
end
