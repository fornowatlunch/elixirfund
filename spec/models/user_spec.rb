require 'spec_helper'

describe User do
  describe '#patient?' do
    it 'should not be a patient by default' do
      FactoryGirl.create(:user).should_not be_a_patient
    end

    it 'should be a patient if they have a patient profile' do
      user = FactoryGirl.create(:user)
      FactoryGirl.create(:patient, user: user)
      user.should be_a_patient
    end
  end
end
