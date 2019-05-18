class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.date :worked_on #年月日
      t.datetime :started_at #出勤時間
      t.datetime :finished_at #退勤時間
      t.string :note
      t.references :user, foreign_key: true
        #↑userモデルを参照【usermodelとattendanceモデルを関連付けてる】
      t.timestamps
    end
  end
end
