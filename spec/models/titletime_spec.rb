# test the behavior of model
# test a subclass of ActiveRecord::Base
# test that some method is returning the right result

require 'spec_helper'

describe Titletime do
  context "existence of parts" do
    it "is valid with movie name, an hour/minute/second, cheese factor, and user owner" do
      titletime = build(:titletime)
      expect(titletime).to be_valid
    end
    it "is invalid without a movie name" do
      expect(build(:titletime, movie: nil)).to have(1).errors_on(:movie)
    end
    it "is invalid without an hour for titletime" do
      expect(build(:titletime, hour: nil)).to have(2).errors_on(:hour)
    end
    it "is invalid without a minute for titletime" do
      expect(build(:titletime, minute: nil)).to have(2).errors_on(:minute)
    end
    it "is invalid without a second for titletime" do
      expect(build(:titletime, second: nil)).to have(2).errors_on(:second)
    end
  end

  context "duplication of entries" do
    it "is invalid with a duplicate movie name" do
      titletime1 = create(:titletime)
      titletime2 = build(:titletime, movie: titletime1.movie)
      expect(titletime2).to have(1).errors_on(:movie)
    end
  end

  context "possible titletime number value problems" do
    it "is invalid if the hour is negative" do
      expect(build(:titletime, hour: -2)).to have(1).errors_on(:hour)
    end
    it "is invalid if the minute is negative" do
      expect(build(:titletime, minute: -43)).to have(1).errors_on(:minute)
    end
    it "is invalid if the second is negative" do
      expect(build(:titletime, second: -14)).to have(1).errors_on(:second)
    end
    it "is invalid if the minute exceeds 59" do
      expect(build(:titletime, minute: 60)).to have(1).errors_on(:minute)
    end
    it "is invalid if the second exceeds 59" do
      expect(build(:titletime, second: 60)).to have(1).errors_on(:second)
    end
  end

  describe "combine parts of titletime" do
    before :each do
      @early_titletime = create(:early_titletime)
    end
    it "returns a titletime with hour, minute, and second combined" do
      expect(@early_titletime.full_time).to eq "00:04:09"
    end
  end
end