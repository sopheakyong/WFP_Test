class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.string :school_code
      t.string :school_name

      t.timestamps
    end
  end
end
