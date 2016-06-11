class CreateEnrolls < ActiveRecord::Migration
  def change
    create_table :enrolls do |t|
      t.integer :user_id
      t.integer :course_id
      t.integer :rating_info
      t.integer :rating_interest
      t.integer :rating_useful
      t.integer :rating_learn
      t.integer :rating_rec
      t.integer :rating_hours

      t.timestamps

    end
  end
end
