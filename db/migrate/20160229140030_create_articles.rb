class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, default: ""
      t.text   :text

      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
