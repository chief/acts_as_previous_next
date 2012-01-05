require 'spec_helper'

describe Post do

  let(:first_post) { FactoryGirl.build(:first_post) }
  let(:second_post) { FactoryGirl.build(:second_post) }

  it 'should return nil on next if no objects exists' do
    first_post.next.should be_nil
  end

  it 'should return nil on previous if no objects exists' do
    first_post.previous.should be_nil
  end

  it 'should return self on next if one object exists' do
    first_post.save
    first_post.next.should == first_post
  end

  it 'should return self on previous if one object exists' do
    first_post.save
    first_post.previous.should eq(first_post)
  end

end
