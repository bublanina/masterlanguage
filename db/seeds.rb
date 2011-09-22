# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = Admin.create!(:email => 'ivazuz@gmail.com', :password => 'adminnimda')

user = User.create!([{ :fname=>"Lenka", :lname=>"Rábeková",
                    :confirmed_at => Date.today, :email => 'ivazuz@gmail.com',
                    :password => 'adminnimda'#, :nick => 'ADMIN'
                    }])

classroom = Classroom.create!({:name=>"firma", :capacity=>10000, :note=>"súkromná miestnosť klienta"})
