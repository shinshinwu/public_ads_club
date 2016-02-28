class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer     :seller_id
      t.integer     :buyer_id
      t.references  :listing
      t.date        :expires_at
      t.datetime    :last_charged_at
      t.string      :last_cc_error
      t.boolean     :auto_renewal
      t.string      :renewal_period
      t.float       :price
      t.string      :charge_id

      t.timestamps
    end

  end
end
