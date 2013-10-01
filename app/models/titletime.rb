class Titletime < ActiveRecord::Base
  belongs_to :user
  validates :movie,  presence: true, uniqueness: true
  validates :hour,   presence: true, numericality: { only_integer: true, greater_than: -1 }
  validates :minute, presence: true, numericality: { only_integer: true, greater_than: -1, less_than: 60 }
  validates :second, presence: true, numericality: { only_integer: true, greater_than: -1, less_than: 60 }
  validates :cheese, presence: true

  def string_with_lead_zero (num)
  # Returns number as a string
  # If only a single digit, a leading zero is included 
    num > 9 ? num.to_s : '0' + num.to_s
  end

  def full_time
  # Takes the individual pieces of the Titletime and puts them together, with colons
    string_with_lead_zero(hour) + ":" + string_with_lead_zero(minute) + ":" + string_with_lead_zero(second)
  end
end