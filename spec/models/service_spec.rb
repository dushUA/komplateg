require 'rails_helper'

RSpec.describe Service, type: :model do
  before { @service = FactoryGirl.create(:service) }

  subject { @service }


  it { should respond_to(:name_service) }
  it { should respond_to(:operations) }

  it { should be_valid}
end
