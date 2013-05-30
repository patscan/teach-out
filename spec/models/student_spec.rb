require 'spec_helper'

describe Student do 

  it "has a valid factory" do
    FactoryGirl.create(:student).should be_valid
  end

  let(:student) { FactoryGirl.create(:student) }

  context "with valid attributes" do
    it "creates a student" do
      student.should be_valid
    end
  end

  context "with invalid attributes" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  context "#active_contacts" do

    let(:active_contact) { FactoryGirl.build(:contact) }

    before(:each) do
      student.contacts << active_contact
      student.contacts << FactoryGirl.build(:contact, :inactive)
    end

    it "return list of active contacts" do
      student.active_contacts.should eq [active_contact]
    end
  end

  context "#send_to_contacts" do

    let(:message) {FactoryGirl.build(:message)}

    before(:each) do
      student.contacts << FactoryGirl.build(:contact)
      student.send_to_contacts(message)
    end

    it "add message to student's messages" do
      student.messages.should include(message)
    end

    it "sends twilio text of message to student's contacts" do
      t = mock(Twilio::RestAccount)
    end

  end

  describe "update_attibutes" do
    context "with valid attributes" do
      # let!(:student) {FactoryGirl.create(:student)}
      student = FactoryGirl.create(:student)
      contact = FactoryGirl.create(:contact, :students => [student])
      let!(:new_contact) {FactoryGirl.create(:new_contact)}
      let!(:contact_student) { FactoryGirl.create(:contact_student, :student => student, :contact => contact)}

    binding.pry
      it "should be failing" do
        attributes = 
        {"student" => 
          {"first_name"=>"Bobby",
           "last_name"=>"Wilson",
           "contacts_attributes"=>
           {"0"=>
            {"first_name"=>"Jkai",
             "last_name"=>"Hsu",
             "relationship_to_student"=>"Father",
             "language"=>"English",
             "phone_number"=>"760-668-5378",
             "email"=>"jkai@son.com",
             "contact_students_attributes"=>
             {"0"=>{"active"=>"false", "_destroy"=>"false", "id"=>"1"}},
             "id"=>"1"},

             "1"=>
             {"first_name"=>"Michael",
               "last_name"=>"Phelps",
               "relationship_to_student"=>"Mother",
               "language"=>"English",
               "phone_number"=>"999-999-9999",
               "email"=>"m@phelps.com",
               "contact_students_attributes"=>
               {"0"=>{"active"=>"false", "_destroy"=>"false"}}}}
               }}

               binding.pry

               student.update_attributes(attributes)
               student.contacts.length.should == 2
               Contact.count.should == 2

             end
   # "student" => {"first_name" => 'new name' , :id => student.id}
   #                    "contacts" => contact1.name}


      # student.name.should == "new name"

      # student.contacts.length.should == 3
      # Contact.count.should == 2
    end
  end

end
