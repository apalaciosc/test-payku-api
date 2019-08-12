Rails.application.routes.draw do
  post 'notify_payku', to: 'transactions#notify_payku', as: :notify_payku
end
