class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


         validates :nickname, presence: true
  
         validates :last_name, presence: true
         validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
         
         validates :first_name, presence: true
         validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
         
         validates :last_name_kana, presence: true
         validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
         
         validates :first_name_kana, presence: true
         validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
         
         validates :birthdate, presence: true
         
         validates :email, presence: true
         validates :email, uniqueness: true
         validates :email, exclusion: { in: ["@"] }
         
         validates :password, presence: true
         validates :password, length: { minimum: 6 }
         validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i }

  has_many :item

end
