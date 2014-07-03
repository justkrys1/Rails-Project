class Editorial < ActiveRecord::Base
  validates_presence_of :title, :author, :published, :content, :image
  validates :date, numericality: { only_integer: true }
  paginates_per 5
end
