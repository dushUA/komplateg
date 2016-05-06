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

require "rails_helper"

RSpec.describe AcceptorsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/acceptors").to route_to("acceptors#index")
    end

    it "routes to #new" do
      expect(:get => "/acceptors/new").to route_to("acceptors#new")
    end

    it "routes to #show" do
      expect(:get => "/acceptors/1").to route_to("acceptors#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/acceptors/1/edit").to route_to("acceptors#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/acceptors").to route_to("acceptors#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/acceptors/1").to route_to("acceptors#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/acceptors/1").to route_to("acceptors#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/acceptors/1").to route_to("acceptors#destroy", :id => "1")
    end

  end
end
