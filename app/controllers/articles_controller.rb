class ArticlesController < ApplicationController

  layout 'new_design'

  def index
    @articles = Article.where("scheduled_date < ?", Time.now).order("scheduled_date DESC")
  end

  def show
    @article = Article.friendly.find(params[:id])
  end

end
