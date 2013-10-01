class User < ActiveRecord::Base
  has_many :titletimes

  validates :username, presence: true, uniqueness: true
  validates :email,    presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end