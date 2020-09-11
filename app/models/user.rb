class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :nickname, presence: true
  
  validates :last_name, presence: true
  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/+\z }

  validates :first_name, presence: true
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/+\z }

  validates :last_name_kana, presence: true
  validates :last_name_kana, format: { with: /\p{katakana}/ }

  validates :first_name_kana, presence: true
  validates :first_name_kana, format: { with: /\p{katakana}/ }

  validates :birthdate, presence: true

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, exclusion: { in: ["@"] }

  validates :encrypted_password, presence: true
  validates :encrypted_password, length: { minimum: 6 }
  validates :encrypted_password format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }




end

