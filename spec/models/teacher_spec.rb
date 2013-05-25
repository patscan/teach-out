require 'spec_helper'

describe Teacher do

  let :teacher do
    build :teacher
  end

  context "with valid attriubutes" do
    it "should create a teacher" do
      teacher.should be_valid
    end
  end

end
