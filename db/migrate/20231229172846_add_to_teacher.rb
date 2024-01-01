class AddToTeacher < ActiveRecord::Migration[7.0]
  def change
    add_column :teachers, :overallGrade, :float
    add_column :teachers, :email, :string
    add_column :teachers, :lattes, :string

    add_column :subjects, :mandatory, :boolean
  end
end
