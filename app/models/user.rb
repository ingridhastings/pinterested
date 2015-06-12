class User < ActiveRecord::Base
  has_many :pins
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
