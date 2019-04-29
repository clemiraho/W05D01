class User < ApplicationRecord
  belongs_to :city
  has_many :potins
  has_many :sent_messages, foreign_key: 'sender_id', class_name: 'PrivateMessage'
  has_many :join_table_recipient_pms, foreign_key: 'recipient_id'
  has_many :received_messages, foreign_key: 'received_message_id', class_name: 'PrivateMessage', through: :join_table_recipient_pms
end
