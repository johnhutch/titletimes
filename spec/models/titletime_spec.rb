# test the behavior of model
# test a subclass of ActiveRecord::Base
# test that some method is returning the right result

require 'spec_helper'

describe Titletime do
  it "is valid with movie name, an hour/minute/second, and cheese factor" do
    titletime = Titletime.new(
      movie: "Amelie",
      hour: 1,
      minute: 5,
      second: 45,
      cheese: true)
    expect(titletime).to be_valid
  end
  it "is invalid without a movie name" do
    expect(Titletime.new(movie: nil)).to have(1).errors_on(:movie)
  end
  it "is invalid without an hour for titletime" do
    expect(Titletime.new(hour: nil)).to have(2).errors_on(:hour)
  end
  it "is invalid without a minute for titletime" do
    expect(Titletime.new(minute: nil)).to have(2).errors_on(:minute)
  end
  it "is invalid without a second for titletime" do
    expect(Titletime.new(second: nil)).to have(2).errors_on(:second)
  end
  it "is invalid without a cheese factor" do
    expect(Titletime.new(cheese: nil)).to have(1).errors_on(:cheese)
  end
  it "is invalid with a duplicate movie name" do
    Titletime.create(movie: "Holes", hour: 1, minute: 32, second: 54, cheese: true)
    titletime = Titletime.new(movie: "Holes", hour: 1, minute: 23, second: 25, cheese: true)
    expect(titletime).to have(1).errors_on(:movie)
  end
  it "is invalid if the hour is negative" do
    expect(Titletime.new(hour: -2)).to have(1).errors_on(:hour)
  end
  it "is invalid if the minute is negative" do
    expect(Titletime.new(minute: -43)).to have(1).errors_on(:minute)
  end
  it "is invalid if the second is negative" do
    expect(Titletime.new(second: -14)).to have(1).errors_on(:second)
  end
  it "is invalid if the minute exceeds 59" do
    expect(Titletime.new(minute: 60)).to have(1).errors_on(:minute)
  end
  it "is invalid if the second exceeds 59" do
    expect(Titletime.new(second: 60)).to have(1).errors_on(:second)
  end
  it "returns a titletime with hour, minute, and second combined" do
    titletime = Titletime.new(movie: "Amelie", hour: 1, minute: 6, second: 9, cheese: true)
    expect(titletime.full_time).to eq "01:06:09"
  end
end