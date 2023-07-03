class StudentTeacherSubject < ApplicationRecord
    belongs_to :user
    belongs_to :teacher
    belongs_to :subject
end
