class CreateCourseResources < ActiveRecord::Migration[5.1]
  def change
    create_table :course_resources do |t|
      t.integer :course_id
      t.integer :resource_id

      t.timestamps
    end
  end
end
