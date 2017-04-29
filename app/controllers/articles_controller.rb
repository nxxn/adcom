class ArticlesController < ApplicationController

  def index
    @articles = Article.where(active: true).order("created_at DESC")
  end

  def show
    @article = Article.friendly.find(params[:id])
  end

end
