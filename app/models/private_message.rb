class PrivateMessage < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  has_many :recipients, foreign_key: 'received_message_id'
  has_many :recipients, foreign_key: 'recipient_id', class_name: "User", through: :join_table_recipient_pm
end
