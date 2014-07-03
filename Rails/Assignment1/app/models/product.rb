class Product < ActiveRecord::Base
  has_many :reviews, :dependent => :destroy
  validates_presence_of :name, :description, :thumbnail, :fullsize
  validates_numericality_of :price, :cost, :weight
  validates :qty, numericality: { only_integer: true }
  paginates_per 5
end
