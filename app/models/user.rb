class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :subscriptions, dependent: :destroy
  
  validates :email, presence: true, uniqueness: true

  # validates :phone, presence: true
  # validates :user, presence: true
  # validates :name, presence: true
  # validates :last_name, presence: true
  # validates :age, presence: true
  # validates :city, presence: true
end
