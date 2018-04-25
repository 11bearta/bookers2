class Book < ApplicationRecord
	belongs_to :user
	validates :Opinion, length: { in: 1..200 }
	validates :Title, presence: true
end
