class Blog < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  validates_presence_of :title, :author, :content
  validates :date, numericality: { only_integer: true }
  paginates_per 5
end
