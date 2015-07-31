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

User.create( :email => "howclf@gmail.com", :password => "zxczxczxc", :avatar_graph_url => Faker::Avatar.image )

User.create( :email => "ihower@gmail.com", :password => "zxczxczxc", :avatar_graph_url => Faker::Avatar.image )

User.create( :email => "hexter.ch@gmail.com", :password => "zxczxczxc", :avatar_graph_url => Faker::Avatar.image )

User.create( :email => "norman@gmail.com", :password => "zxczxczxc", :avatar_graph_url => Faker::Avatar.image )

User.create( :email => "mike@gmail.com", :password => "zxczxczxc", :avatar_graph_url => Faker::Avatar.image )

User.create( :email => "sean@gmail.com", :password => "zxczxczxc", :avatar_graph_url => Faker::Avatar.image )

User.create( :email => "bruce@gmail.com", :password => "zxczxczxc", :avatar_graph_url => Faker::Avatar.image )
