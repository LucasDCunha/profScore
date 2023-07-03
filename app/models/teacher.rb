class Teacher < ApplicationRecord
    has_many :evaluations, dependent: :destroy
    has_many :studentTeacherSubjects, dependent: :destroy
    has_many :subjectTeacherPeriods, dependent: :destroy
end
