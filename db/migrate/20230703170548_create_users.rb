class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|

      t.string :name, presence: true
      t.string :course, presence: true
      t.integer :registration, presence: true
      t.integer :cpf, presence: true
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
