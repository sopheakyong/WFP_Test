class CreateStudentSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :student_schools do |t|
      t.string :school_year
      t.integer :school_id
      t.integer :grade
      t.integer :student_id
      t.timestamps

      =begin
        t.belongs_to :school, index: true
        t.belongs_to :student, index: true
      =end
      
    end
  end
end
