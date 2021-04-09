class Book < ApplicationRecord
	belongs_to :user

	def self.looks(searches, words)
		if searches == "perfect_match"
			@book = Book.where("name LIKE ?", "#{words}")
		elsif
			@book = Book.where("name LIKE ?", "%#{words}%")
		elsif
			@book = Book.where("name LIKE ?", "#{words}%")
		elsif
			@book = Book.where("name LIKE ?","%#{words}")
		end
	end

	validates :title, presence: true, length: {maximum: 20}
	validates :body, presence: true, length: {maximum: 200}
end
