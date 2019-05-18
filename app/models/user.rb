class User < ApplicationRecord
    has_many :attendances, dependent: :destroy #ユーザーが削除された時に、そのユーザーの勤怠情報データも削除する 直訳＊破壊に依存する
    #↓attendanceモデルと関連付けてる → userモデルからattendanceモデルを見た場合は、1対複数
    #⇒ ユーザーは勤怠情報を複数保有している為
    
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
    validates :department, length: { in: 3..50 }, allow_blank: true
end
