class CreateTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :teachers do |t|

      t.string :name, presence: true
      t.string :position, presence: true
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
