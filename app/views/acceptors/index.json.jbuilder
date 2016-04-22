json.array!(@acceptors) do |acceptor|
  json.extract! acceptor, :id, :name_acceptor, :bank_acceptor, :account_acceptor, :key_acceptor, :mfo_acceptor
  json.url acceptor_url(acceptor, format: :json)
end
