require 'faker'

10.times do
  Teacher.create(title: "Ms.", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
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


pat = Teacher.create(title: "Mr.", first_name: "Pat", last_name: "Scanlan",
                 email: "pat@example.com", password: "password", 
                 grade: "6th", zip: Faker::Address.zip)


sean = Student.create(first_name: "Sean", last_name: "Miller",
                 teacher_id: (pat.id))

michael = Student.create(first_name: "Michael", last_name: "Malchak",
                 teacher_id: (pat.id))

avalon = Student.create(first_name: "Avalon", last_name: "Emerson",
                 teacher_id: (pat.id))


jkai = Contact.create(first_name: "Jkai", last_name: "Son", 
                  email: Faker::Internet.email, relationship_to_student: "Parent", 
                  language: "English", phone_number: "+17602850799") #sean

fei = Contact.create(first_name: "Fei-ker", last_name: "Bronson", 
                  email: Faker::Internet.email, relationship_to_student: "Guardian", 
                  language: "English", phone_number: "+14157246575") #pat

johnny = Contact.create(first_name: "Johnny", last_name: "Dogg", 
                  email: Faker::Internet.email, relationship_to_student: "Parent", 
                  language: "English", phone_number: "+14159441274") #avalon

mike = Contact.create(first_name: "Johnny", last_name: "Dogg", 
                  email: Faker::Internet.email, relationship_to_student: "Parent", 
                  language: "English", phone_number: "+17143811795") #michael

sean.contacts << [jkai, mike]
michael.contacts << [fei, johnny]
avalon.contacts << [johnny, jkai]

3.times do 
  message = Message.create(header: "Mr. Scanlan, Perley School", subject: "absence",
                                 content: Faker::Lorem.sentence(8), 
                                 delivered: true, time_sent: Time.now)
  pat.messages << message
  
  fei.messages << message
  fei.students.first.messages << message

  johnny.messages << message
  johnny.students.first.messages << message

  mike.messages << message
  mike.students.first.messages << message
end




