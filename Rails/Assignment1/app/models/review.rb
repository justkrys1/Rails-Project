class Review < ActiveRecord::Base
  belongs_to :product
  validates_presence_of :name, :content
  validates :rating, numericality: { only_integer: true }
  #paginates_per 5

  def self.descending
    order( :created_at => :desc )
  end
end
