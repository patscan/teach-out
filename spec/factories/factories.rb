FactoryGirl.define do

  factory :teacher do
    first_name "Betty"
    last_name "White"
    email {Faker::Internet.email}
    password "password"
    grade "5th"
    zip "88924"
    school_name "Lincoln"
    title "Mrs."
  end

  factory :student do
    first_name "Bobby"
    last_name "Wilson"
  end  

  factory :student_with_contact, :parent => :student do
    before(:create) do |student|
      student.contacts.build attributes_for(:contact)
    end
  end

  factory :contact do
    first_name "Jkai"
    last_name "Hsu"
    relationship_to_student "Parent"
    language "English"
    phone_number{ ((rand(900) + 100).to_s + "-" + (rand(900) + 100).to_s + "-" + (rand(9000) + 1000).to_s) }
    email "jkai@son.com"
    active true
    trait :active do
      active true
    end
    trait :inactive do
      active false
    end
  end

  factory :message do
    teacher
    header "Betty White, 6th Grade, Licoln"
    content "Your son has been absent 3 days this week, please call 415-123-5678"
    subject "Absence"
    trait :delivered do
      delivered true
    end
    trait :undelivered do
      delivered false
    end
  end

end
