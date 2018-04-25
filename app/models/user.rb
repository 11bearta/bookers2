class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


validates :name, length: { in: 2..20 },presence: true
validates :introduction, length: { maximum: 50 }

  attachment :image

  has_many :books

end