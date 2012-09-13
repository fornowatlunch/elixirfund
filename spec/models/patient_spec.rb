require 'spec_helper'

describe Patient do
  it 'should create a wishlist when created' do
    FactoryGirl.create(:patient).wishlist.should_not be_nil
  end
end
