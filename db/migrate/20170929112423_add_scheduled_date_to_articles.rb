class AddScheduledDateToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :scheduled_date, :datetime, default: Time.now
  end
end
