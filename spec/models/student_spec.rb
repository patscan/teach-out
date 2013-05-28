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

end
