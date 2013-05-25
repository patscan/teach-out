require 'spec_helper'

describe Contact do

  let :contact do
    build :contact
  end

  context "with valid attributes" do
    it "should create a contact" do
      contact.should be_valid
    end
  end

  context "with invalid attributes" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:relationship_to_student) }
    it { should validate_format_of(:phone_number).not_with('abc') }
    it { should validate_format_of(:phone_number).not_with('1') }
    it { should validate_format_of(:phone_number).not_with('311-4313') }
  end

end

