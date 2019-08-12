class Transaction < ApplicationRecord
  serialize :summary, Array
  enum step: [:mail_info, :completed, :send_invoice, :attempt, :error]
end
