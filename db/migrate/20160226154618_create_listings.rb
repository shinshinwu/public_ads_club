class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.references :user
      t.boolean    :is_available, default: true
      t.string     :title
      t.text       :description
      t.string     :company_name
      t.string     :phone
      t.string     :ref_id
      t.integer    :width
      t.integer    :height
      t.string     :img_url
      t.float      :base_amount
      t.float      :recurring_amount
      t.string     :charge_frequency
      t.integer    :min_lease_days

      t.timestamps
    end

  end
end
