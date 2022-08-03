require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it "must be created with matching password and password_confirmation field" do 
      @user = User.create( name: "frnk", email: "w@e.com", password:"123" , password_confirmation: "123")
      @user.save
      expect(@user).to be_valid  
    end    
     


    it "must NOT be created with not matching password and password_confirmation field" do 
        @user = User.create(name:"Salmy", email: "w@w.com", password:"12" , password_confirmation: "123")
        @user.save
        expect(@user).to_not be_valid      
    end

    it "is not valid without a name" do 
      @user = User.create( email: "w@w.com", password:"123" , password_confirmation: "123")
      @user.save
      expect(@user).to_not be_valid  
    end     

    it "is not valid without a unique email" do 
      @user1 = User.create( name:"John", email: "w@w.com", password:"123" , password_confirmation: "123")
      @user1.save
      @user2 = User.create( name:"Doe", email: "w@w.com", password:"123" , password_confirmation: "123")
      @user1.save
      expect(@user2).to be_invalid    
    end   


    it "is not valid without a password with more then 2 characters" do 
      @user = User.create( name:"Salmy", email: "w@w.com", password:"1" , password_confirmation: "1")
      @user.save
      expect(@user).to_not be_valid  
    end 
  end 



  describe '.authenticate_with_credentials' do

    it "should login in with good email and pass" do
      @user = User.create( name:"Salma", email: "r@r.com", password:"123" , password_confirmation: "123")
      @user.save
      @login = User.authenticate_with_credentials("r@r.com", "123")
      expect(@login).to be_truthy
    end


    it "should login in with whitespace around email" do
      @user = User.create( name:"jane", email: "abc@abc.com", password:"123" , password_confirmation: "123")
      @user.save #had to add the strip method to the authenticate method
      @login = User.authenticate_with_credentials("    abc@abc.com  ", "123")
      expect(@login).to be_truthy
    end


    it "should login in with caps in email during login" do
      @user = User.create( name:"jane", email: "abc@abc.com", password:"123" , password_confirmation: "123")
      @user.save #had to add the strip method to the authenticate method
      @login = User.authenticate_with_credentials("aBC@abc.com", "123")
      expect(@login).to be_truthy
    end

    it "should return nil for user not in db" do
      @user = User.create( name:"jane", email: "abc@abc.com", password:"123" , password_confirmation: "123")
      @user.save #had to add the strip method to the authenticate method
      @login = User.authenticate_with_credentials("abc@xyz.com", "123")
      expect(@login).to be_nil
    end

  end



end
