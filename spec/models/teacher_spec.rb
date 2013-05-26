require 'spec_helper'

describe Teacher do

  let :teacher do
    build :teacher
  end

  context "with valid attributes" do
    it "should create a teacher" do
      teacher.should be_valid
    end
  end

  context "with invalid attributes" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:grade) }
    it { should validate_presence_of(:zip) }
    it { should ensure_length_of(:password).is_at_least(5) }
  end

end