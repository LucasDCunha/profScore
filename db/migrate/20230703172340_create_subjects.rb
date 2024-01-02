class CreateSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :subjects do |t|

      t.string :name, presence: true
      t.string :code, presence: true
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
