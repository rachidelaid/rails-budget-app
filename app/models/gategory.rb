class Gategory < ApplicationRecord
  belongs_to :user
  has_many :transactions, through: :transaction

  validates :name, presence: true
  validates :logo, presence: true
end
