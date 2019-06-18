class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :student_id
      t.string :student_name
      t.string :sex
      t.date :date_of_birth

      t.timestamps
    end
  end
end
