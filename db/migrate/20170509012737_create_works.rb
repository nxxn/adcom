class CreateWorks < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string     :title, default: ""
      t.text       :description
      t.string     :department, default: ""

      t.attachment :work_image

      t.timestamps null: false
    end
  end
end
