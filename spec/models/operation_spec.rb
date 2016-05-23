require 'rails_helper'

RSpec.describe Operation, type: :model do

  let(:user){ FactoryGirl.create(:user)}
  let(:payer){ FactoryGirl.create(:payer)}
  let(:acceptor){ FactoryGirl.create(:acceptor)}
  let(:service){ FactoryGirl.create(:service)}

  before do

    @operation = Operation.new(date_time_pay: '2016-05-01 09:00:00',
                               date_valut: '2016-05-01',
                               num_ticket: '123456',
                               code_ticket: '1234',
                               key_operation: '7654',
                               destination: 'TeploKom',
                               sum_operation: 23.45,
                               currency_operation: 'UAH',
                               priv_acc_payer: '1234567890',
                               period_pay_start: '2016-05-01',
                               period_pay_end: '2016-05-31',
                               acceptor_id: acceptor.id,
                               payer_id: payer.id,
                               service_id: service.id,
                               user_id: user.id)
  end

  subject{@operation}

  it { should respond_to(:date_time_pay)}
  it { should respond_to(:date_valut)}
  it { should respond_to(:num_ticket)}
  it { should respond_to(:code_ticket)}
  it { should respond_to(:key_operation)}
  it { should respond_to(:destination)}
  it { should respond_to(:sum_operation)}
  it { should respond_to(:currency_operation)}
  it { should respond_to(:priv_acc_payer)}
  it { should respond_to(:period_pay_start)}
  it { should respond_to(:period_pay_end)}
  it { should respond_to(:acceptor_id)}
  it { should respond_to(:payer_id)}
  it { should respond_to(:service_id)}
  it { should respond_to(:user_id)}
  its(:user) { should eq user}
  its(:acceptor) { should eq acceptor}
  its(:payer) { should eq payer}
  its(:service) { should eq service}

  it { should be_valid}

  describe 'when acceptor_id is not present' do
    before { @operation.acceptor_id = nil }
    it { should_not be_valid }
  end
  describe 'when payer_id is not present' do
    before { @operation.payer_id = nil }
    it { should_not be_valid }
  end
  describe 'when service_id is not present' do
    before { @operation.service_id = nil }
    it { should_not be_valid }
  end
  describe 'when user_id is not present' do
    before { @operation.user_id = nil }
    it { should_not be_valid }
  end

end


