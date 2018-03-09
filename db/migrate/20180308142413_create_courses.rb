class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string     :title, default: ""
      t.text       :description, default: ""
      t.string     :book, default: ""
      t.string     :onsite, default: ""
      t.string     :webinar, default: ""
      t.string     :book_link, default: ""

      t.timestamps null: false
    end
  end
end
