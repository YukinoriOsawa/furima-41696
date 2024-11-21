class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 


with_options presence: true do
  # ニックネーム必須
  validates :nickname
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "は@を含む有効な形式で入力してください" }
  
  # パスワードが空では登録できない、6文字未満では登録できない
  validates :encrypted_password, presence: true, length: { minimum: 6 }

  # パスワードとパスワード（確認用）が一致していることを検証
  validates :password, confirmation: true
  validates :encrypted_password, presence: true

  # 姓と名はひらがな、カタカナ、漢字のみ許可する
  validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters." }
  validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters." }

  # 姓カナと名カナはカタカナのみ許可する
  validates :last_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters." }
  validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters." }

  # 生年月日必須
  validates :birth_date
end

end
