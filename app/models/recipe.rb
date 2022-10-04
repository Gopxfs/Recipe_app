class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  validates :name, presence: true
  validates :preparation_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cooking_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :description, presence: true

  def self.public_list
    Recipe.all.where(public: true)
  end

  def total_price
    sum = 0
    recipe_foods.each { |recipe_food| sum += recipe_food.total_price }
    sum
  end
end
