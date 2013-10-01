require 'spec_helper'

describe User do
  it "has a valid factory" do
    expect(create(:user)).to be_valid
  end

  context "existence of attributes" do
    it "is valid with a username, email, and password" do
      expect(build(:user)).to be_valid
    end
    it "is invalid without a username" do
      user = build(:user, username: nil)
      expect(user).to have(1).errors_on(:username)
    end
    it "is invalid without an email" do
      user = build(:user, email: nil)
      expect(user).to have(2).errors_on(:email)
    end
    it "is invalid without password" do
      user = build(:user, password: nil)
      expect(user).to have(3).errors_on(:password)
    end
    it "has three titletimes attached to it" do
      expect(create(:user).titletimes.count).to eq 3
    end
  end

  context "password requirements" do
    it "is invalid with password less than 8 characters" do
      user = build(:user, password: "nope")
      expect(user).to have(2).errors_on(:password)
    end
  end

  context "email requirements" do
    it "is invalid with a duplicate email address" do
      create(:user, email: "test@test.com") # This user persists in the db
      user = build(:user, email: "test@test.com")
      expect(user).to have(2).errors_on(:email)
    end
  end
end