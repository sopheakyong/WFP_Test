class CreateStudentPerformances < ActiveRecord::Migration[5.2]
  def change
    create_table :student_performances do |t|
      t.string :school_year
      t.integer :school_id
      t.integer :grade
      t.integer :student_id
      t.integer :math_s1
      t.integer :khmer_s1
      t.integer :social_s1
      t.integer :math_s2
      t.integer :khmer_s2
      t.integer :social_s2

      t.timestamps
    end
  end
end
