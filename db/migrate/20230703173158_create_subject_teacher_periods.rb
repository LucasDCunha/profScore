class CreateSubjectTeacherPeriods < ActiveRecord::Migration[7.0]
  def change
    create_table :subject_teacher_periods do |t|
      t.belongs_to :Teacher, presence: true, foregin_key: true
      t.belongs_to :Subject, presence: true, foregin_key: true
      t.integer :yearPeriod

      t.timestamps
    end
  end
end
