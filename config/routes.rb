Rails.application.routes.draw do
  get 'transaction/:id', to: 'transactions#transaction', as: :transaction
  post 'notify_payku', to: 'transactions#notify_payku', as: :notify_payku
  post 'save_transaction', to: 'transactions#save_transaction', as: :save_transaction
end
