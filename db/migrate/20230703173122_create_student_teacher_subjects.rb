class CreateStudentTeacherSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :student_teacher_subjects do |t|
      t.belongs_to :User, presence: true, foregin_key: true
      t.belongs_to :Teacher, presence: true, foregin_key: true
      t.belongs_to :Subject, presence: true, foregin_key: true
      t.integer :yearPeriod, presence: true      

      t.timestamps
    end
  end
end
