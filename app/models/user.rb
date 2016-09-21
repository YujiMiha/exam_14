class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :email, presence: true, length: { minimum: 4, maximum: 31 }
  validates :user_name,  length: {  maximum: 31 }
  validates :password, length: { minimum: 4, maximum: 31 }
  validates :password_confirmation, presence: true, length: { minimum: 4, maximum: 31 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy
end
