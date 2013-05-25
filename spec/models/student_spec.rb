require 'spec_helper'

describe Student do

  let :student do
    build :student
  end

  context "with valid attributes" do
    it "should create a student" do
      student.should be_valid
    end
  end

  context "with invalid attributes" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

end