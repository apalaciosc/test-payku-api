class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :token
      t.string :payerid
      t.integer :user_id
      t.decimal :total
      t.string :respuesta
      t.string :ip_address
      t.string :pay_method
      t.integer :subscription_id
      t.integer :step
      t.decimal :dolar
      t.string :summary

      t.timestamps
    end
  end
end
