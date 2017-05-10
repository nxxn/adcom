class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string     :full_name, default: ""
      t.text       :review_text
      t.string     :client_title, default: ""

      t.attachment :client_image

      t.timestamps null: false
    end
  end
end
