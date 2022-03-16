require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "saves a new user" do
      @test_user = User.create({
        first_name: 'Scott',
        last_name: 'Hall',
        email: 'Ramone@wwe.com',
        password: 'chico123',
        password_confirmation: 'chico123'
      })
      expect(@test_user).to be_present
      expect(@test_user.first_name).to be_present
      expect(@test_user.last_name).to be_present
      expect(@test_user.email).to be_present
      expect(@test_user.password).to be_present
      expect(@test_user.password_confirmation).to be_present

      @test_user2 = User.create({
        first_name: 'Scott',
        last_name: 'Summers',
        email: 'Ramone@wwe.com',
        password: '123456',
        password_confirmation: '123456'
      })
      expect(User.find_by last_name: @test_user2.last_name).to be_nil
    end

    it 'has a minimum password length' do
      @test_user = User.create({
        first_name: 'Scott',
        last_name: 'Hall',
        email: 'Ramone@wwe.com',
        password: 'chico',
        password_confirmation: 'chico'
      })
      expect(User.find_by email: @test_user.email).to be_nil
    end
  end

  describe '.authenticate_with_credentials' do
    it 'creates a new session on successful login' do
      @test_user = User.create({
        first_name: 'Scott',
        last_name: 'Hall',
        email: 'Ramone@wwe.com',
        password: 'chico123',
        password_confirmation: 'chico123'
      })
      expect(User.authenticate_with_credentials(@test_user.email, @test_user.password)).to eql @test_user
      expect(User.authenticate_with_credentials('  Ramone@wwe.com   ', @test_user.password)).to eql @test_user
      expect(User.authenticate_with_credentials('RAMONE@wwe.com', @test_user.password)).to eql @test_user


    end
  end
end
