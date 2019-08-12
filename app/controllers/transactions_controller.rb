class TransactionsController < ApplicationController

  def notify_payku
    order_id         = params['order_id']
    transaction_id   = params['transaction_id'] #Payer_ID
    status           = params['status'].to_i #Success: 1
    verification_key = params['verification_key']
    transaction      = Transaction.find(order_id.to_i)
    return unless transaction.present?
    return unless status == 1
    success_pay      = transaction.verify_payment_payku(transaction_id, verification_key)
    render json: success_pay, status: 200
  end

  def save_transaction
    transaction            = Transaction.new
    transaction.user_id    = params[:user_id].to_i
    transaction.total      = params[:amount]
    transaction.summary    = params[:summary]
    transaction.step       = params[:step]
    transaction.pay_method = params[:method]
    transaction.save
    render json: transaction, status: 200
  end
end
