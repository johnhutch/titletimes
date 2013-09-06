require 'spec_helper'

describe User do

  before(:each) do
    @attr = {
      :name => "#{Random.firstname} #{Random.lastname}",
      :email => "#{Random.email}",
      :password => "changeme",
      :password_confirmation => "changeme"
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end

  it "should have a name" do
    user_with_no_name = User.new(@attr.merge(:email => ""))
    user_with_no_name.should_not be_valid

  it "should require an email address" do 
    # Create a user that has an empty email address
    user_with_no_email = User.new(@attr.merge(:email => ""))
    user_with_no_email.should_not be_valid
  end

  it "should accept valid email addresses" do
    # Same thing as
    # addresses = ["user@temp.com", "THE_USER@foo.bar.org", "first.last@foo.jp"]
    addresses = %w[user@temp.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      user_with_valid_email = User.new(@attr.merge(:email => address))
      user_with_valid_email.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      user_with_bad_email = User.new(@attr.merge(:email => address))
      user_with_bad_mail.should_not be_valid
    end
  end

  it "should not allow duplicate email addresses" do
    User.create!(@attr)
    user_with_copy_email = User.new(@attr)
    user_with_copy_email.should_not be_valid
  end

  it "should not allow duplicate email addresses with a different case" do
    uppercase_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => uppercase_email))
    user_with_copy_email = User.new(@attr)
    user_with_copy_email.should_not be_valid
  end

  # Tests for password existence specifically
  describe "passwords" do

    before(:each) do
      @user = User.new(@attr)
    end

    it "should have a password attribute" do
      @user.should respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      @user.should respond_to(:password_confirmation)
    end
  end

  # Tests for password validations & matchings
  describe "password validations" do

    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).should_not be_valid
    end

    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => "notsame")).should_not be_valid
    end

    it "should reject short passwords" do
      short = "asdf"
      User.new(@attr.merge(:password => short, :password_confirmation => short).should_not be_valid
    end
  end

  describe "password encryption" do

    before(:each) do
      @user = User.create!(@attr)
    end

    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end

    it "should set the encrypted password attribute" do
      @user.encrypted_password.should_not be_blank
    end
  end
end















end