# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
include Faker

#Product.destroy_all
#Review.destroy_all
#Blog.destroy_all
ran_cost = sprintf('%.2f', Kernel.rand + rand(1..50))
ran_price = sprintf('%.2f', Kernel.rand + rand(51..99))
ran_weight = sprintf('%.2f', Kernel.rand + rand(1..10))
images = %w( about.jpg articles.jpg fish.jpg main.jpg charter.jpg )
images_author = %w( author1.jpg author2.jpg)
pub = %w( true false)
=begin
1.times do
  product = Product.create( :name => "#{Commerce.product_name}",
                            :description => Lorem.sentences.join(' '),
                            :qty =>rand(1..100),
                            :price =>  ran_price,
                            :cost => ran_cost,
                            :weight => ran_weight,
                            :thumbnail=> images[rand(images.length)],
                            :fullsize => images[rand(images.length)],
                            :created_at =>  rand(1930...2013),
                            :updated_at => rand(1930...2013)
                           )
  product.save!
  if( ! product.nil?)

  (rand(1..10)).times do
   product.reviews.create(  :name => "#{Name.name}",
                          :content =>  Lorem.sentences.join(' ').html_safe,
                          :rating => rand(1..10),
                          :created_at => Time.now
                       )
    puts product.inspect

  end

  end

  end

=end
5.times do
  blog = Blog.create( :title => "#{Company.bs}".split.map(&:capitalize).join(' '),
                      :author => "#{Name.name}",
                      :date => rand(1930..2013),
                      :content => Lorem.paragraphs.join(' '),
                      :created_at => Time.now

  )
  blog.save!
  if( ! blog.nil?)
 (rand(1..10)).times do
   blog.comments.create(  :author => "#{Name.name}",
                          :content =>  Lorem.sentences.join(' ').html_safe,
                          :image => images_author[rand(images_author.length)],
                          :rating => rand(1..10),
                          :created_at => Time.now
                       )

 end
  end
end

=begin
100.times do
  editorial = Editorial.create( :title => "#{Company.bs}".split.map(&:capitalize).join(' '),
                            :author => "#{Name.name}",
                            :date => rand(1930...2013),
                            :published => pub[rand(pub.length)],
                            :content => Lorem.paragraphs.join(' '),
                            :image => images_author[rand(images_author.length)]

                            )
  end

=end



