namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do
    # fill User table
    User.create!(name: 'Test user',
                 email: 'test2@railstutorial.org',
                 password: 'foobar',
                 password_confirmation: 'foobar',
                 admin: true)
    20.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password = 'password'
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    # fill Acceptor table
    Acceptor.create!(name_acceptor: 'Test Acceptor',
                     bank_acceptor: 'Bank acceptor',
                     account_acceptor: 'Account acceptor',
                     key_acceptor: 'Key acceptor',
                     mfo_acceptor: 'MFO acceptor')
    20.times do |n|
      name = Faker::Company.name
      bank = Faker::Company.suffix
      account = Faker::Number.number(14)
      key = Faker::Number.number(8)
      mfo = Faker::Number.number(6)
      Acceptor.create!(name_acceptor: name,
                   bank_acceptor: bank,
                   account_acceptor: account,
                   key_acceptor: key,
                   mfo_acceptor: mfo)
    end

    # fill Payer table
    Payer.create!(id_main: 1,
                  fio: 'Ivanov Ivan',
                  adress: 'home adress',
                  invoice: '1234 **** **** 5678',
                  telephone: '555-23-46',
                  bank_payer: 'Test bank')
    20.times do |n|
      fio = Faker::Name.name
      adress   = Faker::Address.street_address
      invoice = Faker::Number.number(4)+' **** **** '+Faker::Number.number(4)
      telephone = Faker::Base.numerify('+380(##) ### ####')
      bank_payer = Faker::Company.name
      Payer.create!(id_main: 1,
                       fio: fio,
                       adress: adress,
                       invoice: invoice,
                       telephone: telephone,
                       bank_payer: bank_payer)
    end

    # fill Service table
    Service.create!(name_service: 'Water')
    10.times do |n|
      name_service = Faker::Commerce.product_name
      Service.create!(name_service: name_service)
    end

    # fill Operations table
    100.times do |n|
      date_time_pay = Faker::Time.between(1.year.ago, Date.today, :day)
      date_valut = date_time_pay
      num_ticket = Faker::Number.number(4)
      code_ticket = Faker::Number.number(4)
      key_operation = Faker::Number.number(4)
      destination = Faker::Lorem.sentence(3)
      sum_operation = Faker::Number.decimal(2)
      currency_operation = 'UAH'
      priv_acc_payer = Faker::Number.number(4)
      period_pay_start = date_time_pay.at_beginning_of_month
      period_pay_end = date_time_pay.at_end_of_month
      payer_id = Faker::Number.between(1, 5)
      acceptor_id = Faker::Number.between(1, 20)
      service_id = Faker::Number.between(1, 10)
      user_id = Faker::Number.between(1, 2)
      Operation.create!(date_time_pay: date_time_pay,
                         date_valut: date_valut,
                         num_ticket: num_ticket,
                         code_ticket: code_ticket,
                         key_operation: key_operation,
                         destination: destination,
                         sum_operation: sum_operation,
                         currency_operation: currency_operation,
                         priv_acc_payer: priv_acc_payer,
                         period_pay_start: period_pay_start,
                         period_pay_end: period_pay_end,
                         payer_id: payer_id,
                         acceptor_id: acceptor_id,
                         service_id: service_id,
                         user_id: user_id)
    end
  end
end