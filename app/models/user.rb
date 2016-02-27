class User < ActiveRecord::Base
  has_many    :listings
  has_many    :send_messages, class_name: "Message", foreign_key: "sender_id"
  has_many    :received_messages, class_name: "Message", foreign_key: "recipient_id"

  validates :email,    :presence => true,
                       :uniqueness => true,
                       :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  has_secure_password

  def name
    if first_name.present? && last_name.present?
      return first_name + " " + last_name
    else
      return nil
    end
  end

end