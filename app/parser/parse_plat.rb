class ParsePlat
  def initialize(file_name, user)
    @parser_file = PDF::Reader.new(file_name)
    @user = user
    @out_params = {added: 0, errors: 0}
  end

  attr_reader :out_params

  def parse_pdf
    # read pdf file
    text =''
    @parser_file.pages.each do |page|
      text += page.text+"\n"
    end

    # delim cards in text
    cards = text.each_line('Клиент: Я проверил и подтверждаю правильность указанных реквизитов.').to_a
    cards.map! {|card| card.split(/\n+/)}

    # delim line in card
    inline_delim_reg =/(: )+?/
    cards.each do |card|
      card.map!{|str| str.split(inline_delim_reg)}.compact!
      ind = 0
      unless card.empty?
        card.each do |line|
          line.delete_at(1) if line[1]==': '
          line << nil if line.size==1
          if line.size>2
            line[1] = line[1..-1].join
            line.delete_at(2) while line.size>2
          end
          if line[0].to_s.start_with?('№ квитанции')
            line[1] = line[0].split(/№ квитанции/)[1].to_s.strip
            line[0] = '№ квитанции'
          end
          ind = card.index(line) if line[0] == 'Назначение'
        end

        # if destination field split on 2 strings
        card[ind][1]+=' '+card[ind+1][0] if card[ind+1][0] != 'Сумма'

        new_card = Hash[*card.flatten]

        # fill, found or insert Service
        name_service = new_card['Наименование услуги']
        service = Service.find_or_create_by!(name_service: name_service)

        # fill, found or insert Payer
        fio = new_card['ФИО']
        adress = new_card['Адрес']
        invoice = new_card['Дебет счета']
        telephone = new_card['Телефон']
        bank_payer = new_card['Банк плательщика']
        payer = Payer.create_with(telephone: telephone).find_or_create_by!(fio: fio,
                                         adress: adress,
                                         invoice: invoice,
                                         bank_payer: bank_payer)
        payer = Payer.find_by_id_main(payer.id_main) if payer.id_main != 0

        # fill, found or insert Acceptor
        name_acceptor = new_card['Получатель']
        bank_acceptor = new_card['Банк получателя']
        account_acceptor = new_card['Р/С получателя']
        key_acceptor = new_card['Код получателя']
        mfo_acceptor = new_card['МФО получателя']
        acceptor = Acceptor.find_or_create_by!(name_acceptor: name_acceptor,
                                               bank_acceptor: bank_acceptor,
                                               account_acceptor: account_acceptor,
                                               key_acceptor: key_acceptor,
                                               mfo_acceptor: mfo_acceptor)

        # fill, found or insert Operation
        date_time_pay = DateTime.strptime(new_card['Дата оплаты'],'%d.%m.%Y %H:%M:%S')
        date_valut =new_card['Дата валютир.']
        num_ticket = new_card['№ квитанции']
        code_ticket = new_card['Код квитанции']
        key_operation = new_card['Ключ']
        destination = new_card['Назначение']
        sum = new_card['Сумма'].to_s.split
        sum_operation = sum[0].to_f
        currency_operation =sum[1]
        priv_acc_payer =new_card['Л/С плательщика']
        period = new_card['Период оплаты'].split
        period[0] = '01.'+period[0] if period[0].size<6
        period_pay_start = Date.strptime(period[0], '%d.%m.%y')
        period_pay_end = period_pay_start.end_of_month
        operation = Operation.find_or_create_by!(date_time_pay: date_time_pay,
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
                                                 payer: payer,
                                                 acceptor: acceptor,
                                                 service: service,
                                                 user: @user)

        operation ? @out_params[:added]+=1 : @out_params[:errors] +=1

      end
    end
  end
end