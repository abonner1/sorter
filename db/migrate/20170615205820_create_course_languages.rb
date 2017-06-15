class CreateCourseLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :course_languages do |t|
      t.integer :language_id
      t.integer :course_id

      t.timestamps
    end
  end
end
