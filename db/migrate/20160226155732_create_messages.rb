class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references  :listing
      t.integer     :sender_id
      t.integer     :recipient_id
      t.string      :subject
      t.text        :body
      t.date        :start_date
      t.date        :end_date

      t.timestamps
    end

  end
end
