class HomeController < ApplicationController

  layout 'new_design', only: [:new_homepage]

  def index
    @article = Article.last

    @message = Message.new
  end

  def clients
  end

  def services
  end

  def about
  end

  def contact
    @message = Message.new
  end

  def writeitwell
  end

  def new_homepage
    @message = Message.new
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
