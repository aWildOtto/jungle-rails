class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product


  validates :product, presence: true
  validates :description, presence: true
  validates :rating, presence: true
  validates :rating, numericality: {
    only_integer: true, 
    greater_than_or: 0, 
    less_than: 6
  }
  validates :user, presence: true
end
