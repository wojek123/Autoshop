class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :cars
  has_many :purchases

  def purchased_car?(car,user)
  	!user.purchases.where(car_id: car).empty?
  end
end
