class AddDocumentToArticles < ActiveRecord::Migration
  def up
    add_attachment :articles, :document
    add_column :articles, :pdf, :boolean, default: false
  end

  def down
    remove_attachment :articles, :document
    remove_column :articles, :pdf
  end
end
