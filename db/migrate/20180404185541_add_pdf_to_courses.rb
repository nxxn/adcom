class AddPdfToCourses < ActiveRecord::Migration
  def up
    add_attachment :courses, :pdf
  end

  def down
    remove_attachment :courses, :pdf
  end
end
