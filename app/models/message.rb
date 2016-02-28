class Message < ActiveRecord::Base
  belongs_to :listing
  belongs_to :inquiries, class_name: "Transaction"
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"
  belongs_to :recipient, class_name: "User", foreign_key: "recipient_id"

end