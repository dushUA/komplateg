require 'rails_helper'

RSpec.describe Payer, type: :model do
  before do
    @payer = Payer.new(id_main: 1,
                       fio: 'Test Ivan',
                       adress: '1 street',
                       invoice: '12345',
                       telephone: '123-456',
                       bank_payer: 'Payers Bank' )
  end

  subject{@payer}

  it {should respond_to :id_main}
  it {should respond_to :fio}
  it {should respond_to :adress}
  it {should respond_to :telephone}
  it {should respond_to :invoice}
  it {should respond_to :bank_payer}

  it {should be_valid}


end
