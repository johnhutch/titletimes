require 'spec_helper'

describe User do
  it "is invalid with a duplicate email address" do
    User.create(username: "Tester", email: "test@test.com", password: "password", password_confirmation: "password")
    newuser = User.new(username: "Other", email: "test@test.com", password: "password", password_confirmation: "password")
    expect(newuser).to have(2).errors_on(:email)
  end
end