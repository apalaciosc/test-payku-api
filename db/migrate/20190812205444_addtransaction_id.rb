class AddtransactionId < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :transaction_id, :integer
  end
end
