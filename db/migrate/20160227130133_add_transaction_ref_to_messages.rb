class AddTransactionRefToMessages < ActiveRecord::Migration
  def change
    add_reference :messages, :transaction, index: true, foreign_key: true
  end
end