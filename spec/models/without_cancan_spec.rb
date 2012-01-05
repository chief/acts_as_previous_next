require 'spec_helper'

describe WithoutCancan do

  let(:wc1) { FactoryGirl.build(:wc1) }
  let(:wc2) { FactoryGirl.build(:wc2) }

  it 'should return nil on next if no objects exists' do
    wc1.next.should be_nil
  end

  it 'should return nil on previous if no objects exists' do
    wc1.previous.should be_nil
  end

  it 'should return self on next if one object exists' do
    wc1.save
    wc1.next.should eq(wc1)
  end

  it 'should return self on previous if one object exists' do
    wc1.save
    wc1.previous.should eq(wc1)
  end

  it 'should return valid next object ' do
    wc1.save
    wc2.save
    wc1.next.should eq(wc2)
  end

  it 'should return valid previous object' do
    wc1.save
    wc2.save
    wc2.previous.should eq(wc1)
  end

  it 'should return self if next is called on previous' do
    wc1.save
    wc2.save
    wc1.previous.next.should eq(wc1)
  end

  it 'should return self if previous is called on next' do
    wc1.save
    wc2.save
    wc1.next.previous.should eq(wc1)
  end

end
