class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name, null: false
      t.boolean :active, defualt: false
      t.integer :department_id, foreign_key: true
    end
  end
end
