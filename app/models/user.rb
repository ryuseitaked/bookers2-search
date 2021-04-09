class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  attachment :profile_image, destroy: false

  def self.looks(searches, words)
   if searches == 'perfect_match'
      @user = User.where("name LIKE ?", "#{words}")
   else
      @user = User.where("name LIKE ?", "%#{words}%")
   end
  end

  validates :name, presence: true, uniqueness: true, on: :create
  validates :name, length: {maximum: 20, minimum: 2}, uniqueness: true
  validates :introduction, length: { maximum: 50 }
end
