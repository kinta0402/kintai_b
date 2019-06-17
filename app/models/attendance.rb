class Attendance < ApplicationRecord
  belongs_to :user #userモデルとの紐づけ 1対1
  
  validates :worked_on, presence: true
end
