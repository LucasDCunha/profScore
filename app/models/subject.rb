class Subject < ApplicationRecord
    has_many :studentTeacherSubjects, dependent: :destroy
    has_many :subjectTeacherPeriods, dependent: :destroy
end
