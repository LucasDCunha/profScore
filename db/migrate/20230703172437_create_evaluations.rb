class CreateEvaluations < ActiveRecord::Migration[7.0]
  def change
    create_table :evaluations do |t|
      t.belongs_to :user, presence: true, foregin_key: true
      t.belongs_to :teacher, presence: true, foregin_key: true
      t.belongs_to :subject, presence: true, foregin_key: true
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
