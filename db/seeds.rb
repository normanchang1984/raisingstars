# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create( :name => '比賽' )
Category.create( :name => '訓練' )
Category.create( :name => '物資' )

User.create( :email => "ihower@gmail.com", :password => "12345678", :avatar_graph_url => Faker::Avatar.image )


2.times do
  User.create!( :email => Faker::Internet.email, :password => Faker::Internet.password(8) )
end

3.times do |i|
  num = i.to_i + 4
  Proposal.create!( :name => Faker::Name.name , :email => Faker::Internet.email, :phone =>Faker::PhoneNumber.cell_phone, :self_intro => Faker::Lorem.paragraph(5) , :title => Faker::Lorem.word, :content => Faker::Lorem.paragraph(20), :category_id => Category.last.id, :user_id => User.first.id, :title_graph_url => Faker::Avatar.image, :target => 800)
  e = Proposal.last
  e.products.create!( :title => "Basic", :price => "100", :description => "....", :proposal_id => e.id )
  e.products.create!( :title => "standard", :price => "500", :description => "真是相當優秀", :proposal_id => e.id)
  e.products.create!( :title => "Premium", :price => "1000", :description => "根本好棒棒", :proposal_id => e.id)
end

3.times do |i|
  num = i.to_i + 1
  Proposal.create!( :name => Faker::Name.name , :email => Faker::Internet.email, :phone =>Faker::PhoneNumber.cell_phone, :self_intro => Faker::Lorem.paragraph(5) , :title => Faker::Lorem.word, :content => Faker::Lorem.paragraph(20), :category_id => Category.first.id, :user_id => User.last.id, :title_graph_url => Faker::Avatar.image, :target => 800)
  e = Proposal.last
  e.products.create!( :title => "Basic", :price => "100", :description => "....", :proposal_id => e.id )
  e.products.create!( :title => "standard", :price => "500", :description => "真是相當優秀", :proposal_id => e.id)
  e.products.create!( :title => "Premium", :price => "1000", :description => "根本好棒棒", :proposal_id => e.id)
end

