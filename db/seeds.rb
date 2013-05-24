# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'


10.times do
  Teacher.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                 email: Faker::Internet.email, password: "password", 
                 grade: "6th", zip: Faker::Address.zip)
end

n = 11
10.times do
  Student.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                 teacher_id: (n-=1))
end


Student.all.each do |student|
 contact = Contact.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, 
                  email: Faker::Internet.email, relationship_to_student: "Guardian", 
                  language: "English", phone_number: Faker::PhoneNumber.phone_number)
  student.contacts << contact
end

n = 11
Contact.all.each do |contact|
  message = Message.create(header: "Mr. Brown, 6th Grade", 
                           content: Faker::Lorem.sentence(5),
                           delivered: true, time_sent: Time.now, teacher_id: (n-=1))
  contact.messages << message
end

pat = Teacher.create(first_name: "Pat", last_name: "Scanlan",
                 email: "pat@example.com", password: "password", 
                 grade: "6th", zip: Faker::Address.zip)

sean = Student.create(first_name: "Sean", last_name: "Miller",
                 teacher_id: (pat.id))

michael = Student.create(first_name: "Michael", last_name: "Malchak",
                 teacher_id: (pat.id))

avalon = Student.create(first_name: "Avalon", last_name: "Emerson",
                 teacher_id: (pat.id))

jkai = Contact.create(first_name: "Jkai", last_name: "Son", 
                  email: Faker::Internet.email, relationship_to_student: "Daddy", 
                  language: "English", phone_number: "+17602850799")

sean.contacts << jkai
michael.contacts << jkai
avalon.contacts << jkai


