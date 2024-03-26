class Evaluation < ApplicationRecord
    belongs_to :teacher
    belongs_to :subject
    belongs_to :user
end
