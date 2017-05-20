class Entry < ApplicationRecord

  has_many :user_entries, dependent: :destroy
  has_many :users, through: :user_entries
end
