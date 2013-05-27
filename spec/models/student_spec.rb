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

  context "when the student has one contact" do

    let(:active_contact) { FactoryGirl.build(:contact) }

    before(:each) do
      student.contacts << active_contact
      student.contacts << FactoryGirl.build(:contact, :inactive)
    end

    it "we see list of contacts via student.active_contacts" do
      student.active_contacts.should eq [active_contact]
    end
  end

end