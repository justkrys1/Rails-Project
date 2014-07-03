class Comment < ActiveRecord::Base
  belongs_to :blog
  validates_presence_of :author, :content, :image
  validates :rating, numericality: { only_integer: true }
  #paginates_per 5
end
