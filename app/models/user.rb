class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :password, format: { with: /\A[a-zA-Z0-9]+\z/,message: "is invalid. Input half-size characters."}
    validates :password, length: {minimum: 6}
    validates :nickname
    validates :familyname, format: { with: /\A[ぁ-んァ-ン一-龥々]/,message: "is invalid. Input full-width characters." }
    validates :firstname, format: { with: /\A[ぁ-んァ-ン一-龥々]/,message: "is invalid. Input full-width characters." }
    validates :familyname_kana, format: { with: /\A[ァ-ヶー－]+\z/,message: "is invalid. Input full-width katakana characters." }
    validates :firstname_kana, format: { with: /\A[ァ-ヶー－]+\z/,message: "is invalid. Input full-width katakana characters." }
    validates :birthday
  end
end
