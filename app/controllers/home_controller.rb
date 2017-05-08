class HomeController < ApplicationController

  layout 'new_design', only: [:new_homepage, :write_it_well, :adcomdesigns]

  def index
    @article = Article.last

    @message = Message.new
  end

  def new_homepage
    @articles = Article.order("created_at DESC").limit(6)
  end

  def create
    @message = Message.new(params[:message])

    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      redirect_to(root_path, :notice => "Message was successfully sent.")
    else
      flash.now.alert = "Please fill all fields."
      render :index
    end
  end

end
