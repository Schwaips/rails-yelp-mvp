class Restaurant < ApplicationRecord
  CATEGORIES = [ "Chinese", "Italian", "Japanese", "French", "Belgian"]
  validates :name, :address, presence: true
  validates :category, inclusion: { in: CATEGORIES }, presence: true
  has_many  :reviews, dependent: :destroy
end



# CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]
#   validates :name, :address, presence: :true
#   validates :category, inclusion: { in: CATEGORIES }
#   has_many :reviews, dependent: :destroy
# end
