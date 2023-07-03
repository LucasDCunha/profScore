class CreateEvaluations < ActiveRecord::Migration[7.0]
  def change
    create_table :evaluations do |t|
      t.belongs_to :User, presence: true, foregin_key: true
      t.belongs_to :Teacher, presence: true, foregin_key: true
      t.integer :overallGrade, presence: true
      t.boolean :usedTime, presence: true
      t.boolean :externalThings, presence: true
      t.boolean :goodKnoledge, presence: true
      t.boolean :takeAgain, presence: true
      t.boolean :attendenceDemand, presence: true

      t.timestamps
    end
  end
end
