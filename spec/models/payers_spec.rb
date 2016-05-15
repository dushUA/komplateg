require 'rails_helper'

RSpec.describe Payer, type: :modelest  do
  before { @payer = FactoryGirl.create(:payer) }

  subject { @payer }


  it { should respond_to(:fio) }
  it { should respond_to(:adress) }
  it { should respond_to(:invoice) }
  it { should respond_to(:telephone) }
  it { should respond_to(:bank_payer) }

  it {should be_valid}

  describe 'when FIO is not present' do
    before { @payer.fio = ' ' }
    it { should_not be_valid }
  end

  # describe 'when MFO is already taken' do
  #   before do
  #     acceptor_with_same_mfo = @acceptor.dup
  #     acceptor_with_same_mfo.mfo_acceptor = @acceptor.mfo_acceptor
  #     acceptor_with_same_mfo.save
  #   end
  #   it { should_not be_valid }
  # end
end
