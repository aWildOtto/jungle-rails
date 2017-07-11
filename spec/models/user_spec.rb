require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it { should validate_uniqueness_of(:email)}

    it { should validate_presence_of(:password)}
    it { should validate_confirmation_of(:password)}

    it { should validate_presence_of(:first_name)}
    it { should validate_presence_of(:last_name)}

    it { should validate_length_of(:password).
              is_at_least(6).
              is_at_most(20).
              on(:create)}

  end

  describe '.authenticate_with_credentials' do
    before(:each) do
      @user = User.new(
        email: "cait@gmail.com",
        password: "12345678",
        password_confirmation: "12345678",
        first_name: 'Cait',
        last_name: 'Quan'
      )
    end

    it "return true if credentials match" do
      @user.save
      expect(User.authenticate_with_credentials("cait@gmail.com", "12345678")).to be_eql @user
    end 

    it "return nil if password is wrong" do
      @user.save
      expect(User.authenticate_with_credentials("cait@gmail.com", "1234518")).to be nil
    end 

    it "return nil if email doesn't exist" do
      @user.save
      expect(User.authenticate_with_credentials("asdasdcait@gmail.com", "12345123678")).to be nil
    end 
    
    it "return a user object if email is capitalized" do
      @user.save
      expect(User.authenticate_with_credentials("CAIT@GMAIL.COM", "12345678")).to be_eql @user
    end 
    
    it "return user if email has spaces in the front" do
      @user.save
      expect(User.authenticate_with_credentials("   CAIT@GMAIL.COM", "12345678")).to be_eql @user
    end 
    
    it "return user if email has spaces in the end" do
      @user.save
      expect(User.authenticate_with_credentials("CAIT@GMAIL.COM     ", "12345678")).to be_eql @user
    end 

  end
end
