FactoryGirl.define do

  factory :teacher do
    first_name "Betty"
    last_name "White"
    email "betty@white.com"
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

  factory :contact do
    first_name "Jkai"
    last_name "Hsu"
    relationship_to_student "Parent"
    language "English"
    phone_number "+14157246575"
    email "jkai@son.com"
    active true
  end

  factory :message do
    teacher
    contact
    student
    header "Betty White, 6th Grade, Licoln"
    content "Your son has been absent 3 days this week, please call 415-123-5678"
    delivered false
    subject "Absence"
  end

end