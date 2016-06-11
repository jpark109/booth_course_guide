class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|
      t.string :name
      t.string :title
      t.text :bio
      t.string :image_url
      t.string :email
      t.integer :course_id

      t.timestamps

    end
  end
end
