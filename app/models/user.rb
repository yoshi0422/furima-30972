class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
    with_options presence: true do
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i ,message: "is invalid. Input half-size characters."}, length: {minimum: 6}
    validates :nickname
    validates :birthday
      with_options format: { with: /\A[ぁ-んァ-ン一-龥々]/,message: "is invalid. Input full-width characters." } do
        validates :familyname
        validates :firstname
      end
      with_options format: { with: /\A[ァ-ヶー－]+\z/,message: "is invalid. Input full-width katakana characters." } do
        validates :familyname_kana
        validates :firstname_kana
      end
    end

  has_many :items
  has_many :orders
end