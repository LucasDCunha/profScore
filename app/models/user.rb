class User < ApplicationRecord
    has_many :evaluations, dependent: :destroy
    has_many :studentTeacherSubjects, dependent: :destroy
end
