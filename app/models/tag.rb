class Tag < ApplicationRecord
  has_many :join_table_potin_tags
  has_many :potins, through: :join_table_potin_tags
end
