class Attendance < ApplicationRecord
  belongs_to :user #user model と、attendance model を関連づけている user_idにて ※9章attendanceモデル参照
  #↑ userモデルに属する ※Attendanceモデルから見たuserは1対1の関係 【出勤情報から見たuserは一人】
end
