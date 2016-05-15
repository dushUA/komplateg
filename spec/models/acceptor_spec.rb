require 'rails_helper'

RSpec.describe Acceptor, type: :modelest  do
  before { @acceptor = Acceptor.new(name_acceptor: 'Test Acceptor',
                                    bank_acceptor: 'Bank acceptor',
                                    account_acceptor: 'Account acceptor',
                                    key_acceptor: 'Key acceptor',
                                    mfo_acceptor: 'MFO acceptor') }

  subject { @acceptor }


  it { should respond_to(:name_acceptor) }
  it { should respond_to(:bank_acceptor) }
  it { should respond_to(:account_acceptor) }
  it { should respond_to(:key_acceptor) }
  it { should respond_to(:mfo_acceptor) }

  it {should be_valid}

  describe 'when name_acceptor is not present' do
    before { @acceptor.name_acceptor = ' ' }
    it { should_not be_valid }
  end

  describe 'when MFO is already taken' do
    before do
      acceptor_with_same_mfo = @acceptor.dup
      acceptor_with_same_mfo.mfo_acceptor = @acceptor.mfo_acceptor
      acceptor_with_same_mfo.save
    end
    it { should_not be_valid }
  end
end
