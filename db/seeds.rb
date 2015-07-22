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

Reward.create( :price => '100' )
Reward.create( :price => '500' )
Reward.create( :price => '1000' )

User.create( :email => "ihower@gmail.com", :password => "12345678" )


2.times do
  User.create( :email => Faker::Internet.email, :password => Faker::Internet.password(8), :avatar_url => Faker::Avatar.image("my-own-slug", "50x50") )
end

3.times do
  Proposal.create( :name => Faker::Name.name , :email => Faker::Internet.email, :phone =>Faker::PhoneNumber.cell_phone, :self_intro => Faker::Lorem.paragraph(5) , :title => Faker::Lorem.word, :content => Faker::Lorem.paragraph(20), :category_id => Category.last.id, :user_id => User.first.id, :title_graph_url => Faker::Avatar.image("picture-title", "360x235") )
end

3.times do
  Proposal.create( :name => Faker::Name.name , :email => Faker::Internet.email, :phone =>Faker::PhoneNumber.cell_phone, :self_intro => Faker::Lorem.paragraph(5) , :title => Faker::Lorem.word, :content => Faker::Lorem.paragraph(20), :category_id => Category.first.id, :user_id => User.last.id )
end

