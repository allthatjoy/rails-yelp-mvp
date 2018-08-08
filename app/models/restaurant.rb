class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, :address, presence: true
  validates :category, presence: true, inclusion: { in: ['chinese', 'japanese', 'belgian', 'french', 'italian']}
end
