class Transaction < ApplicationRecord
  serialize :summary, Array
  enum step: [:mail_info, :completed, :send_invoice, :attempt, :error]

  def verify_payment_payku transaction_id, verification_key
    params_request = Transaction.get_params_payku_request
    url            = "#{params_request[:url]}/verificar"
    dolar          = Transaction.get_indicador("dolar")
    price          = total.to_f * dolar
    query = {
      transaction_id: transaction_id,
      verification_key: verification_key,
      token: params_request[:token],
      currency_code: 'CLP',
      amount: price,
      email: '',
      detail: ''
    }
    response = HTTParty.get(url, query: query, headers: { 'Content-Type' => 'application/json' })
    return response.to_s == "VALID" ? true : false
  end

  def self.get_params_payku_request
    url        = 'https://des.payku.cl/gateway'
    token      = '84161b73016a6d1f4044d05d0393fc75'
    notify_url = ''
    return { url: url, token: token, notify_url: notify_url }
  end

  def self.get_indicador indicador
    response = HTTParty.get("http://www.mindicador.cl/api/#{indicador}")
    serie    = JSON.parse(response)['serie'][0]['valor'] rescue 680
    return serie
  end
end
