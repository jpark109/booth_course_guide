class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :number
      t.integer :section
      t.string :title
      t.string :quarter
      t.integer :year
      t.string :daytime
      t.string :prereq
      t.integer :rating
      t.integer :professor_id
      t.integer :user_id

      t.timestamps

    end
  end
end
