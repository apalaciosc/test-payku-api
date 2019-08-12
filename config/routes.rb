Rails.application.routes.draw do
  post 'notify_payku', to: 'transactions#notify_payku', as: :notify_payku
  post 'save_transaction', to: 'transactions#save_transaction', as: :save_transaction
end
