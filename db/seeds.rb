# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(1..5).each do |f|
  Question.create(title: "başlık #{f}", content: "içerik #{f}", user_id: 1)
end

(5..10).each do |f|
  Question.create(title: "başlık #{f}", content: "içerik #{f}", user_id: 2)
end