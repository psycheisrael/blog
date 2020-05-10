class Order < ApplicationRecord
  belongs_to :customer
  validates :product_name, presence: true
  validates :product_count, presence: true
  validates :product_count, numericality: { only_integer: true }
  validates_presence_of :customer
  def to_s
    costumer.full_name + "has ordered " + product_count.to_s + product_name
  end
end
