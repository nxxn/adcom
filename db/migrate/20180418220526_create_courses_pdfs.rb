class CreateCoursesPdfs < ActiveRecord::Migration
  def change
    create_table :courses_pdfs do |t|
      t.attachment :main_pdf

      t.timestamps null: false
    end
  end
end
