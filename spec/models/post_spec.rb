require 'spec_helper'

describe Post do

  let(:fp1) { FactoryGirl.build(:first_post) }
  let(:fp2) { FactoryGirl.build(:second_post) }

  context 'with current ability as admin' do

    let(:admin) { FactoryGirl.build(:admin) }

    before(:each) do
      @current_ability = Ability.new(admin)
    end

    it 'should return nil on next if no objects exists' do
      fp1.next(@current_ability).should be_nil
    end

    it 'should return nil on previous if no objects exists' do
      fp1.previous(@current_ability).should be_nil
    end

    it 'should return self on next if one object exists' do
      fp1.save
      fp1.next(@current_ability).should eq(fp1)
    end

    it 'should return self on previous if one object exists' do
      fp1.save
      fp1.previous(@current_ability).should eq(fp1)
    end

    it 'should return valid next object ' do
      fp1.save
      fp2.save
      fp1.next(@current_ability).should eq(fp2)
    end

    it 'should return valid previous object' do
      fp1.save
      fp2.save
      fp2.previous(@current_ability).should eq(fp1)
    end

    it 'should return self if next is called on previous' do
      fp1.save
      fp2.save
      fp1.previous(@current_ability).next(@current_ability).should eq(fp1)
    end

    it 'should return self if previous is called on next' do
      fp1.save
      fp2.save
      fp1.next(@current_ability).previous(@current_ability).should eq(fp1)
    end

  end

  context 'with current ability as user' do

    let(:admin) { FactoryGirl.build(:admin) }
    let(:user) { FactoryGirl.build(:user) }
    let(:fp3) { FactoryGirl.build(:third_post) }

    before(:each) do
      admin.save
      user.save
      fp1.user_id = user.id
      fp3.user_id = user.id
      fp2.user_id = admin.id
      fp1.save
      fp2.save
      fp3.save
      @current_ability = Ability.new(user)
    end

    it 'should not reach invalid next object' do
      fp1.next(@current_ability).should_not eq(fp2)
    end

    it 'should not reach invalid previous object' do
      fp3.previous(@current_ability).should_not eq(fp2)
    end

    it 'should reach valid next object' do
      fp1.next(@current_ability).should eq(fp3)
    end

    it 'should reach valid previous object' do
      fp3.previous(@current_ability).should eq(fp1)
    end

  end


end
